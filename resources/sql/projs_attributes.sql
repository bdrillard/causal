-- name: create-projs-attributes-table!
-- Initializes the table for projs_attributes
CREATE TABLE IF NOT EXISTS users_attributes (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    proj_id INT UNSIGNED NOT NULL,
    attribute_id INT UNSIGNED NOT NULL,

    PRIMARY KEY(id),

    FOREIGN KEY(proj_id)
        REFERENCES projs(id)
        ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY(attribute_id)
        REFERENCES attributes(id)
        ON UPDATE CASCADE ON DELETE CASCADE
) 
