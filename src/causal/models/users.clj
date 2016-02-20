(ns causal.models.users
  (:require [yesql.core :refer [defqueries]]
            [causal.models.spec :refer [mysql-db]]))

(defqueries "sql/users.sql" {:connection mysql-db})

(defn get-user
  [username]
  (first (select-user {:username username})))

(defn create-user
  [params]
  (insert-user! params))
