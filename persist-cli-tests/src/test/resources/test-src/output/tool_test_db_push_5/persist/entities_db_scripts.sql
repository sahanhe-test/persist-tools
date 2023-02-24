DROP TABLE IF EXISTS MedicalNeed;

CREATE TABLE MedicalNeed (
	fooNeedId INT NOT NULL,
	fooItemId INT NOT NULL,
	fooBeneficiaryId INT NOT NULL,
	period DATETIME NOT NULL,
	urgency INT NOT NULL,
	foo INT NOT NULL,
	PRIMARY KEY(fooNeedId)
);
