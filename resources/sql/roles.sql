-- name: create-roles-table!
-- Initializes the table for roles
CREATE TABLE IF NOT EXISTS roles (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    role TINYINT UNSIGNED NOT NULL,
    description VARCHAR(32),
    
    PRIMARY KEY(id),
    CONSTRAINT UNIQUE(role)
)
