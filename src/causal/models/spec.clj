(ns causal.models.spec
  (:require [yesql.core :refer [defqueries]]))

(defn get-uri
  []
  (get (System/getenv) "CLEARDB_DATABSE_URI" " "))

(defn get-db-info
  [uri]
  (let [clear-db (clojure.string/split uri #"://|:|@|/|\?")]
    {:db (get clear-db 4 "causal_dev")
     :host (get clear-db 3 "localhost")
     :user (get clear-db 1 "root")
     :password (get clear-db 2 "password")
     :port "3306"}))

(let [db-info (get-db-info (get-uri))]
  (def mysql-db {:classname "com.mysql.jdbc.Driver"
                 :subprotocol "mysql"
                 :subname (str "//" (:host db-info) ":" (:port db-info) "/" (:db db-info))
                 :user (:user db-info)
                 :password (:password db-info)}))
