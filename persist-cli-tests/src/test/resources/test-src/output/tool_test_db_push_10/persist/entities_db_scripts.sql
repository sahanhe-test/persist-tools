DROP TABLE IF EXISTS User;
DROP TABLE IF EXISTS Profile;

CREATE TABLE Profile (
	id INT NOT NULL,
	name VARCHAR(191) NOT NULL,
	isAdult BOOLEAN NOT NULL,
	salary FLOAT NOT NULL,
	age DECIMAL NOT NULL,
	PRIMARY KEY(id)
);

CREATE TABLE User (
	id INT NOT NULL,
	name VARCHAR(191) NOT NULL,
	PRIMARY KEY(id)
);
