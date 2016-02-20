-- name: create-users-table!
-- Initializes the table for users
CREATE TABLE IF NOT EXISTS users (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    first VARCHAR(32) NOT NULL,
    last VARCHAR(32) NOT NULL,
    email VARCHAR(64) NOT NULL,
    password BINARY(60) NOT NULL,
    
    PRIMARY KEY(id)
    CONSTRAINT UNIQUE(email)
)
