DROP DATABASE IF EXISTS AnimalProfiles;
CREATE DATABASE IF NOT EXISTS AnimalProfiles;
USE AnimalProfiles;

DROP TABLE IF EXISTS Profiles;
DROP TABLE IF EXISTS Animals;
DROP TABLE IF EXISTS Pictures;
DROP TABLE IF EXISTS Staff;
DROP TABLE IF EXISTS ProfileVolunteer;


CREATE TABLE Profiles(
	profileID 	INT NOT NULL AUTO_INCREMENT,
	dateAndTime TIMESTAMP,

	PRIMARY KEY (testID)
);

CREATE TABLE Animals(
	animalID INT NOT NULL AUTO_INCREMENT,
	profileID INT NOT NULL,
	name VARCHAR(50),
	species VARCHAR(50),
	gender VARCHAR(10),
	color VARCHAR (50),
	markings TEXT,
	location VARCHAR(100),
	neutered BOOLEAN,
	vaccinated BOOLEAN,
	adopted BOOLEAN,
	remarks TEXT,
	cage label VARCHAR (20),

	PRIMARY KEY (animalID),
	FOREIGN KEY (profiles) REFERENCES Profiles (profileID)
);

CREATE TABLE Pictures(
	pictureID INT NOT NULL AUTO_INCREMENT,
	animalID INT NOT NULL,

	PRIMARY KEY (pictureID),
	FOREIGN KEY (animalID) REFERENCES Animals (animalID)
);

CREATE TABLE Staff (
	volunteerID INT NOT NULL AUTO_INCREMENT,
	rank VARCHAR (30),

	PRIMARY KEY (volunteerID)
);

CREATE TABLE ProfileVolunteer (
	pvID INT,
	profileID INT,
	volunteerID INT,

	PRIMARY KEY (pvID),
	FOREIGN KEY (profileID) REFERENCES Profiles (profileID),
	FOREIGN KEY (volunteerID) REFERENCES Staff (volunteerID)
);

DELETE FROM Profiles;
DELETE FROM Animals;
DELETE FROM Pictures;
DELETE FROM Staff;
DELETE FROM ProfileVolunteer;

INSERT INTO Profiles VALUES
(001, CURRENT_TIMESTAMP),
(002, CURRENT_TIMESTAMP);

INSERT INTO Animals VALUES
(001, 002, "Marli", "Beagle", "Female", "Black", "Has a brown spot on the stomach", "Tondo", 0, 1, 0, "NONE", "NONE");

INSERT INTO Pictures VALUES
(001, 001);

INSERT INTO Staff VALUES
(001, "Secretary General");

INSERT INTO ProfileVolunteer VALUES
(002, 001);

SELECT * FROM Profiles;
SELECT * FROM Animals;
SELECT * FROM Pictures;
SELECT * FROM Staff;
SELECT * FROM ProfileVolunteer;