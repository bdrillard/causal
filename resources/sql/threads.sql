-- Initializes the table of threads for discussing projects
CREATE TABLE IF NOT EXISTS threads (
	id INT UNSIGNED NOT NULL AUTO_INCREMENT,
	name VARCHAR(64) NOT NULL,
	date_created TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,

	PRIMARY KEY(id),
	INDEX(date_created)
)
