-- name: create-users-attributes-table!
-- Initializes the table for users_attributes
CREATE TABLE IF NOT EXISTS users_attributes (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    user_id INT UNSIGNED NOT NULL,
    attribute_id INT UNSIGNED NOT NULL,

    PRIMARY KEY(id),

    FOREIGN KEY(user_id)
        REFERENCES users(id)
        ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY(attribute_id)
        REFERENCES attributes(id)
        ON UPDATE CASCADE ON DELETE CASCADE
) 
