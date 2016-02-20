-- name: create-projs-attrs-table!
-- Initializes the table for projs_attrs
CREATE TABLE IF NOT EXISTS users_attrs (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    proj_id INT UNSIGNED NOT NULL,
    attr_id INT UNSIGNED NOT NULL,

    PRIMARY KEY(id),

    FOREIGN KEY(proj_id)
        REFERENCES projs(id)
        ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY(attr_id)
        REFERENCES attrs(id)
        ON UPDATE CASCADE ON DELETE CASCADE
) 
