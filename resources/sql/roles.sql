-- name: create-roles-table!
-- Initializes the table for roles
CREATE TABLE IF NOT EXISTS roles (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    role TINYINT UNSIGNED NOT NULL,
    name VARCHAR(32),
    
    PRIMARY KEY(id),
    CONSTRAINT UNIQUE(role)
)

-- name: insert-role!
-- Insert a new role
INSERT IGNORE INTO roles (id, role, name)
    VALUES (NULL, :role, :name)
