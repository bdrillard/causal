-- name: create-users-projs-table!
-- Initializes the users_projs table
CREATE TABLE IF NOT EXISTS users_projs (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    user_id INT UNSIGNED NOT NULL,
    proj_id INT UNSIGNED NOT NULL,

    PRIMARY KEY(id),
    index(user_id),

    FOREIGN KEY(user_id)
        REFERENCES users(id)
        ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY(proj_id)
        REFERENCES projs(id)
        ON UPDATE CASCADE ON DELETE CASCADE
)
