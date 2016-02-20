-- name: create-projects-table!
-- Initializes the table for projects
CREATE TABLE IF NOT EXISTS projects (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    name VARCHAR(64) NOT NULL,
    description TEXT,
    data_created DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL,

    PRIMARY KEY(id),
    INDEX(name),
    CONSTRAINT UNIQUE(name)
)
