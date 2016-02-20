-- name: create-posts-table!
-- Initializes the table of posts for threads
CREATE TABLE IF NOT EXISTS posts (
	id INT UNSIGNED NOT NULL AUTO_INCREMENT,
	content TEXT,
	date_created TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
	user_id INT UNSIGNED NOT NULL,
	thread_id INT UNSIGNED NOT NULL,

	PRIMARY KEY(id),
	INDEX(date_created),

	FOREIGN KEY(user_id)
		REFERENCES users(id)
		ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY(thread_id)
		REFERENCES threads(id)
		ON UPDATE CASCADE ON DELETE CASCADE	
)
