-- name: create-attributes-table!
-- Intializes the table for attributes
CREATE TABLE IF NOT EXISTS attributes (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    name VARCHAR(32) NOT NULL,

    PRIMARY KEY(id),
    CONSTRAINT UNIQUE(name)
)
