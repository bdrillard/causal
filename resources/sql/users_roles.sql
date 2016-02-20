-- name: create-users-roles-table!
-- Initialize the table for users_roles
CREATE TABLE IF NOT EXISTS users_roles (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    user_id INT UNSIGNED NOT NULL,
    role_id INT UNSIGNED NOT NULL,
    
    PRIMARY KEY(id),
    index(user_id),

    FOREIGN KEY(user_id)
        REFERENCES users(id)
        ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY(role_id)
        REFERENCES roles(id)
        ON UPDATE CASCADE ON DELETE CASCADE
)
