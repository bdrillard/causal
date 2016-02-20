-- Initializes the threads_users table
CREATE TABLE IF NOT EXISTS threads_users (
	id INT UNSIGNED NOT NULL,
	thread_id INT UNSIGNED NOT NULL,
	user_id INT UNSIGNED NOT NULL,

	PRIMARY KEY(id),
	INDEX(user_id),

	FOREIGN KEY(user_id)
		REFERENCES users(id)
		ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY(thread_id)
		REFERENCES threads(id)
		ON UPDATE CASCADE ON DELETE CASCADE
)
