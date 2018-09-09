/* 
Script Name:  Video Store Tracking System (VSTS)
Developer:    Tu Tong
Date:         December 6, 2017
Purpose:      Create tables with primary key constraints
              and adding constraints to existing tables.
*/

/**********************************/
/********** DROP TABLES ***********/
/**********************************/
DROP TABLE vstblRentals CASCADE CONSTRAINTS;
DROP TABLE vstblMovies CASCADE CONSTRAINTS;
DROP TABLE vstblActors CASCADE CONSTRAINTS;
DROP TABLE vstblBoxes CASCADE CONSTRAINTS;
DROP TABLE vstblCastMemberRoles CASCADE CONSTRAINTS;
DROP TABLE vstblCastMembers CASCADE CONSTRAINTS;
DROP TABLE vstblCustomers CASCADE CONSTRAINTS;
DROP TABLE vstblDistributors CASCADE CONSTRAINTS;
DROP TABLE vstblGenders CASCADE CONSTRAINTS;
DROP TABLE vstblGenreBridge CASCADE CONSTRAINTS;
DROP TABLE vstblGenres CASCADE CONSTRAINTS;
DROP TABLE vstblMediumTypes CASCADE CONSTRAINTS;
DROP TABLE vstblStates CASCADE CONSTRAINTS;

/**********************************/
/******** CREATE TABLES ***********/
/**********************************/

CREATE TABLE vstblActors (
	ActorID			NUMBER(6),
	StageLName		VARCHAR2(30),
	StageFName		VARCHAR2(25),
	DOB				DATE,
	PlaceOfBirth	VARCHAR2(50),
		CONSTRAINT vstblActors_ActorID_pk PRIMARY KEY(ActorID)
);

CREATE TABLE vstblBoxes (
	BoxID			      NUMBER(2),
	MovieID 		    NUMBER(6),
	MediumTypeCode	CHAR(3),
	DateBoxReceived DATE,
	RentalCount		  NUMBER(9),
		CONSTRAINT vstblBoxes_BoxID_pk PRIMARY KEY(BoxID),
		CONSTRAINT vstblBoxes_MediumTypeCode_ck CHECK
		  (MediumTypeCode IN('VHS','DVD','BLU'))
);

CREATE TABLE vstblCastMemberRoles (
	CastMemberRoleID			NUMBER(5),
	CastMemberRoleTitle 		VARCHAR2(30),
	CastMemberRoleDescription	VARCHAR2(50),
		CONSTRAINT vstblCastMemberRoles_CastMemberRoleID_pk PRIMARY KEY(CastMemberRoleID)
);

CREATE TABLE vstblCastMembers (
  MovieID             NUMBER(6) NOT NULL,
  ActorID             NUMBER(6) NOT NULL,
  CastMemberRoleID    NUMBER(5) NOT NULL
);

CREATE TABLE vstblCustomers (
	CustomerID		NUMBER(6),
	GenderCode		CHAR(1) NOT NULL,
	StateCode       CHAR(2) NOT NULL,
	FirstName		  VARCHAR2(20),
	LastName		  VARCHAR2(30),
	Address			  VARCHAR2(50),
	City			VARCHAR2(25),
	Zip				CHAR(5),
	Phone			CHAR(10),
	DOB				DATE,
		CONSTRAINT vstblCustomers_CustomerID_pk PRIMARY KEY(CustomerID)
);

CREATE TABLE vstblDistributors (
	DistributorID		  NUMBER(6),
	DistributorName		VARCHAR2(30),
		CONSTRAINT vstblDistributors_DistributorID_pk PRIMARY KEY(DistributorID)
);

CREATE TABLE vstblGenders (
	GenderCode			    CHAR(1),
	GenderDescription 	VARCHAR2(30)
);

CREATE TABLE vstblGenres (
	GenreID			      CHAR(3),
	GenreTitle  	    VARCHAR2(30),
  GenreDescription  VARCHAR2(150),
		CONSTRAINT vstblGenres_GenreID_pk PRIMARY KEY(GenreID)
);

CREATE TABLE vstblGenreBridge (
	GenreID 			    CHAR(3) NOT NULL,
	MovieID 			    NUMBER(6) NOT NULL,
	GenreTitle			  VARCHAR2(15),
	GenreDescription 	VARCHAR2(30),
		CONSTRAINT vstblGenreBridge_GenreID_fk FOREIGN KEY(GenreID)
		  REFERENCES vstblGenres(GenreID)
);

CREATE TABLE vstblMediumTypes (
	MediumTypeCode		CHAR(3),
	MediumDescription	VARCHAR2(30),
		CONSTRAINT vstblMediumTypes_MediumTypeCode_pk PRIMARY KEY(MediumTypeCode)
);

CREATE TABLE vstblMovies (
	MovieID				    NUMBER(6),
	DistributorID		  NUMBER(6) NOT NULL,
	MovieName		    	VARCHAR2(100),
	MovieReleaseDate	DATE,
	
		CONSTRAINT vstblMovies_MovieID_pk PRIMARY KEY(MovieID),
		CONSTRAINT vstblMovies_DistributorID_fk FOREIGN KEY(DistributorID)
		  REFERENCES vstblDistributors(DistributorID)
);

CREATE TABLE vstblRentals (
	RentalID		  NUMBER(6),
	CustomerID		NUMBER(6) NOT NULL,
	BoxID 			  NUMBER(6) NOT NULL,
	RentalDate 		DATE,
	ReturnDate 		DATE,
		CONSTRAINT vstblRentals_RentalID_pk PRIMARY KEY(RentalID),
		CONSTRAINT vstblRentals_CustomerID_fk FOREIGN KEY(CustomerID)
			REFERENCES vstblCustomers(CustomerID),
		CONSTRAINT vstblRentals_BoxID_fk FOREIGN KEY(BoxID)
		  REFERENCES vstblBoxes(BoxID)
);

CREATE TABLE vstblStates (
	StateCode   CHAR(2),
	StateName   VARCHAR2(15),
	FirstZip		NUMBER(5),
	LastZip			NUMBER(5),
		CONSTRAINT vstblStates_StateCode_pk PRIMARY KEY(StateCode)
);

SELECT *
  FROM user_constraints
  WHERE constraint_name LIKE 'VSTBL%';

/*************************************/
/*** CREATE FOREIGN KEY CONSTRAINTS **/
/*************************************/

--  A-2C  Creating a Unique constraint
ALTER TABLE vstblGenders
  MODIFY (GenderCode CONSTRAINT vstblGenders_GenderCode_uk UNIQUE);
  
-- A-2D
ALTER TABLE vstblGenders
  MODIFY (GenderCode CONSTRAINT vstblGenders_GenderCode_ck 
          CHECK (GenderCode IN ('M', 'F', 'O')));
  
--  A-2E  NULL value isn't allowed in FK key 
ALTER TABLE vstblBoxes
  MODIFY (MovieID CONSTRAINT vstblBoxes_MovieID_nn NOT NULL);

ALTER TABLE vstblBoxes
  ADD CONSTRAINT vstblBoxes_MovieID_fk FOREIGN KEY(MovieID)
  REFERENCES vstblMovies(MovieID);

ALTER TABLE vstblCustomers
  ADD CONSTRAINT vstblCustomers_GenderCode_fk FOREIGN KEY(GenderCode)
  REFERENCES vstblGenders(GenderCode);
  
ALTER TABLE vstblCastMembers
  ADD CONSTRAINT vstblCastMember_MovieID_fk FOREIGN KEY(MovieID)
  REFERENCES vstblMovies(MovieID);
