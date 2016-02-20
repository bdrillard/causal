(ns causal.models.spec
  (:require [yesql.core :refer [defqueries]]))

(defn get-sys-var
  [varname default]
  (get (System/getenv) varname default))

(defn get-db-info
  []
  {:db (get-sys-var "DATABASE_NAME" "causal_dev")
   :host (get-sys-var "DATABASE_HOST" "localhost")
   :user (get-sys-var "DATABASE_USER" "root")
   :password (get-sys-var "DATABASE_PASSWORD" "password")
   :port (get-sys-var "DATABASE_PORT" "3306")})

(let [db-info (get-db-info)]
  (def mysql-db {:classname "com.mysql.jdbc.Driver"
                 :subprotocol "mysql"
                 :subname (str "//" (:host db-info) ":" (:port db-info) "/" (:db db-info))
                 :user (:user db-info)
                 :password (:password db-info)}))
