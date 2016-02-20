-- name: create-orgs-table!
-- Initializes the table for orgs
CREATE TABLE IF NOT EXISTS orgs (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    name VARCHAR(128) NOT NULL,
    ein VARCHAR(9) NOT NULL,
    address VARCHAR(512) NOT NULL,

    PRIMARY KEY(id),
    CONSTRAINT UNIQUE(ein)
)
