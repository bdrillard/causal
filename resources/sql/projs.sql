-- name: create-projs-table!
-- Initializes the table for projects
CREATE TABLE IF NOT EXISTS projs (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    name VARCHAR(64) NOT NULL,
    description TEXT,
    date_created TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,

    PRIMARY KEY(id),
    INDEX(name),
    CONSTRAINT UNIQUE(name)
)
