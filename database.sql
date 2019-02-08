#################################################################################################################
#MIT License

#Copyright (c) 2019 Roy Christoper Yabut

#Permission is hereby granted, free of charge, to any person obtaining a copy
#of this software and associated documentation files (the "Software"), to deal
#in the Software without restriction, including without limitation the rights
#to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
#copies of the Software, and to permit persons to whom the Software is
#furnished to do so, subject to the following conditions:

#The above copyright notice and this permission notice shall be included in all
#copies or substantial portions of the Software.

#THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
#IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
#FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
#AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
#LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
#OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
#SOFTWARE.

#This is a course requirement for CS 192 Software Engineering II under the supervision 
#of Asst. Prof. Ma. Rowena C. Solamo of the Department of Computer Science, College of Engineering, 
#University of the Philippines, Diliman for the AY 2018-2019.

#################################################################################################################

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