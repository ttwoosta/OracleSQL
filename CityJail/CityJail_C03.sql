
/* Drop all tables */

DROP TABLE Aliases;
DROP TABLE Criminals;
DROP TABLE Crimes;
DROP TABLE Sentences;
DROP TABLE Prob_officers;
DROP TABLE Crime_charges;
DROP TABLE Crime_officers;
DROP TABLE Officers;
DROP TABLE Appeals;
DROP TABLE Crime_codes;


/* Create table Aliases */

CREATE TABLE Aliases (	
	Alias_ID		NUMBER(6),	-- primary key
	Criminal_ID		NUMBER(6,0),	-- foreign key
	Alias			VARCHAR2(10)   
);

/* Create table Criminals */

CREATE TABLE Criminals (
	Criminal_ID		NUMBER(6,0),	-- primary key
	Last			VARCHAR2(15),
	First			VARCHAR2(10),
	Street			VARCHAR2(30),
	City			VARCHAR2(20),
	State			CHAR(2),
	Zip			CHAR(5),
	Phone			CHAR(10),
	V_status		CHAR(1) DEFAULT 'N',
	P_status		CHAR(1) DEFAULT 'N'
);

/* Create table Crimes */

CREATE TABLE Crimes (
	Crime_ID		NUMBER(9,0),	-- primary key
	Criminal_ID		NUMBER(6,0),	-- foreign key
	Classification		CHAR(2),
	Date_charged		DATE,
	Status			CHAR(2),
	Hearing_date		DATE,
	Appeal_cut_date		DATE
);

/* Create table Sentences */

CREATE TABLE Sentences (
	Sentence_ID		NUMBER(6),	-- primary key
	Criminal_ID		NUMBER(6),	-- foreign key
	Type			CHAR(1),
	Prob_ID			NUMBER(5),	-- foreign key
	Start_date		DATE,
	End_date		DATE,
	Violations		NUMBER(3)
);

/* Create table Prob Officers */

CREATE TABLE Prob_officers (
	Prob_ID			NUMBER(5),	-- primary key
	Last			VARCHAR2(15),
	First			VARCHAR2(10),
	Street			VARCHAR2(30),
	City			VARCHAR2(20),
	State			CHAR(2),
	Zip			CHAR(5),
	Phone			CHAR(10),
	Email			VARCHAR2(30),
	Status			CHAR(1) DEFAULT 'A'
);

/* Create table Crime Charges */

CREATE TABLE Crime_charges (
	Charge_ID		NUMBER(10,0),	-- primary key
	Crime_ID		NUMBER(9,0),	-- foreign key
	Crime_code		NUMBER(3,0),	-- foreign key
	Charge_status		CHAR(2),
	Fine_amount		NUMBER(7,2),
	Court_fee		NUMBER(7,2),
	Amount_paid		NUMBER(7,2),
	Pay_due_date		DATE
);	

/* Create table Crime officers */

CREATE TABLE Crime_officers (
	Crime_ID		NUMBER(9,0),	-- foreign key
	Officer_ID		NUMBER(8,0)	-- foreign key
);

/* Create table Officers */

CREATE TABLE Officers (
	Officer_ID		NUMBER(8,0),	-- primary key
	Last			VARCHAR2(15),
	First			VARCHAR2(10),
	Precinct		VARCHAR2(4),
	Badge			VARCHAR2(14),
	Phone			CHAR(10),
	Status			CHAR(1) DEFAULT 'A'
);

/* Create table Appeals */

CREATE TABLE Appeals (
	Appeal_ID		NUMBER(5),	-- primary key
	Crime_ID		NUMBER(9,0),	-- foreign key
	Filing_Date		DATE,
	Hearing_Date		DATE,
	Status			CHAR(1) DEFAULT 'P'
);

/* Create table Crime codes */

CREATE TABLE Crime_codes (
	Crime_code		NUMBER(3,0),	-- primary key
	Code_description	VARCHAR2(30)
);
