(ns causal.models.users
  (:require [yesql.core :refer [defqueries]]
            [causal.models.spec :refer [mysql-db]]))

(defqueries "sql/users.sql" {:connection mysql-db})

(defn get-user-username
  [username]
  (first (select-user-username {:username username})))

(defn get-user-email
  [email]
  (first (select-user-email {:email email})))

(defn create-user
  [params]
  (insert-user! params))
