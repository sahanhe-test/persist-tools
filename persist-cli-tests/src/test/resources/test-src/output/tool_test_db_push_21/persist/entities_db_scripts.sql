DROP TABLE IF EXISTS Profile;
DROP TABLE IF EXISTS User;

CREATE TABLE User (
	id INT NOT NULL,
	PRIMARY KEY(id)
);

CREATE TABLE Profile (
	id INT NOT NULL,
	name VARCHAR(191) NOT NULL,
	gender VARCHAR(191),
	userId INT NOT NULL,
	CONSTRAINT FK_PROFILE_USER FOREIGN KEY(userId) REFERENCES User(id),
	PRIMARY KEY(id)
);
