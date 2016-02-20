-- name: create-users-attrs-table!
-- Initializes the table for users_attrs
CREATE TABLE IF NOT EXISTS users_attrs (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    user_id INT UNSIGNED NOT NULL,
    attr_id INT UNSIGNED NOT NULL,

    PRIMARY KEY(id),

    FOREIGN KEY(user_id)
        REFERENCES users(id)
        ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY(attr_id)
        REFERENCES attrs(id)
        ON UPDATE CASCADE ON DELETE CASCADE
) 
