-- name: create-users-table!
-- Initializes the table for users
CREATE TABLE IF NOT EXISTS users (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    username VARCHAR(32) NOT NULL,
    first VARCHAR(32),
    last VARCHAR(32),
    email VARCHAR(64) NOT NULL,
    password BINARY(98) NOT NULL,
    date_joined TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    
    PRIMARY KEY(id),
    CONSTRAINT UNIQUE(username),
    CONSTRAINT UNIQUE(email)
)

-- name: select-user
-- Gets user info for a given username
SELECT * FROM users
    WHERE username = :username

-- name: insert-user!
-- Create a new user
INSERT INTO users (id, first, last, email, password, date_joined)
    VALUES (NULL, :first, :last, :email, :password, NULL)
