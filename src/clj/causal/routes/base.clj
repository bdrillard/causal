(ns causal.routes.base
  (:require [ring.util.response :refer [redirect response]]
            [buddy.hashers :refer [check encrypt]]
            [compojure.core :refer :all]
            [causal.views.errors :as err]
            [causal.views.public :as pub]
            [causal.views.users :as user]
            [causal.models.users :refer [get-user-username get-user-email create-user]]))
(defn home
  []
  (pub/index))

(defn error-403
  [request]
  (err/page-403))

(defn error-404
  [request]
  (err/page-404))

(defn register
  [request]
  (pub/register))

(defn login
  [request]
  (pub/login))

(defn logout
  [request]
  (-> (redirect "/")
      (assoc :session nil)))

(defn login-authenticate
  [request]
  (let [username (get-in request [:form-params "username"])
        password (get-in request [:form-params "password"])
        session (:session request)
        found-password (-> username get-user-username :password)
        errors (cond
                 (not found-password) {:username true}
                 (not (check password found-password)) {:password true}
                 :else nil)]
    (if (seq errors)
      (response (pub/login errors))
      (let [next-url (get-in request [:query-params "next"] "/")
            updated-session (assoc session :identity (keyword username))]
        (-> (redirect next-url)
            (assoc :session updated-session))))))

(defn register-user
  [request]
  (let [username (get-in request [:form-params "username"])
        password (get-in request [:form-params "password"])
        confirm (get-in request [:form-params "confirm"])
        email (get-in request [:form-params "email"])
        errors (cond-> {}
                 (not= password confirm) (assoc :password true)
                 (seq (get-user-username username)) (assoc :username true)
                 (seq (get-user-email email)) (assoc :email true))]
    (if (seq errors)
      (response (pub/register errors))
      (let [encrypted-password (encrypt password)
            updated-session (assoc (:session request) :identity (keyword username))
            params {:username username
                    :password encrypted-password
                    :first (get-in request [:form-params "first_name"])
                    :last (get-in request [:form-params "last_name"])
                    :email email}]
        (create-user params)
        (-> (redirect "/user/setup")
            (assoc :session updated-session))))))

(defroutes base-routes
  (GET "/" [] (home))
  (GET "/error-404" [] error-404)
  (GET "/error-403" [] error-403)

  (context "/user" [] user/user-routes)

  (GET "/register" [] register)
  (POST "/register" [] register-user)
  (GET "/login" [] login)
  (POST "/login" [] login-authenticate)
  (GET "/logout" [] logout))
