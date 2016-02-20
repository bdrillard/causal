-- name: create-users-orgs-table!
-- Initializes the table for users_orgs
CREATE TABLE IF NOT EXISTS users_orgs (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    user_id INT UNSIGNED NOT NULL,
    org_id INT UNSIGNED NOT NULL,

    PRIMARY KEY(id),

    FOREIGN KEY(user_id)
        REFERENCES users(id)
        ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY(org_id)
        REFERENCES orgss(id)
        ON UPDATE CASCADE ON DELETE CASCADE
)
