(ns causal.models.migrations
  (:require [yesql.core :refer [defqueries]]
            [causal.models.spec :refer [mysql-db]]))

(defqueries "sql/attrs.sql" {:connection mysql-db})
(defqueries "sql/orgs.sql" {:connection mysql-db})
(defqueries "sql/projs.sql" {:connection mysql-db})
(defqueries "sql/projs_attrs.sql" {:connection mysql-db})
(defqueries "sql/roles.sql" {:connection mysql-db})
(defqueries "sql/users.sql" {:connection mysql-db})
(defqueries "sql/users_attrs.sql" {:connection mysql-db})
(defqueries "sql/users_orgs.sql" {:connection mysql-db})
(defqueries "sql/users_projs.sql" {:connection mysql-db})
(defqueries "sql/users_roles.sql" {:connection mysql-db})

(def default-roles
  [{:role 1 :name "admin"}
   {:role 2 :name "moderator"}
   {:role 3 :name "representative"}
   {:role 4 :name "lead"}
   {:role 5 :name "developer"}])

(defn migrate
  []
  (do 
    (create-attrs-table!)
    (create-orgs-table!)
    (create-posts-table!)
    (create-projs-table!)
    (create-projs-attrs-table!)
    (create-roles-table!)
    (create-threads-table!)
    (create-threads-users-table!)
    (create-users-table!)
    (create-users-attrs-table!)
    (create-users-orgs-table!)
    (create-users-projs-table!)
    (create-users-roles-table!)))

(defn populate
  []
  (doseq [role default-roles]
    (insert-role! role)))
