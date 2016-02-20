(ns causal.routes.users
  (:require [ring.util.response :refer [redirect response]]
            [compojure.core :refer :all]
            [causal.views.users :as users]))

(defn setup-dialogue
  [request]
  ())

(defroutes user-routes
  (GET "/setup" [] setup-dialogue))
