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

-- name: select-user-username
-- Gets user info for a given username
SELECT * FROM users
    WHERE username = :username

-- name: select-user-email
-- Gets user info for a given email
SELECT * FROM users
    WHERE email = :email

-- name: insert-user!
-- Create a new user
INSERT INTO users (id, username, first, last, email, password, date_joined)
    VALUES (NULL, :username, :first, :last, :email, :password, NULL)
