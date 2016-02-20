-- name: create-attrs-table!
-- Intializes the table for attrs
CREATE TABLE IF NOT EXISTS attrs (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    name VARCHAR(32) NOT NULL,

    PRIMARY KEY(id),
    CONSTRAINT UNIQUE(name)
)
