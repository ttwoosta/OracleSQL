/* Create table tblCustomer */

CREATE TABLE tblCustomer (
	CustomerID		NUMBER(6),
	FirstName		VARCHAR2(20) NOT NULL,
	LastName		VARCHAR2(20) NOT NULL,
	Address			VARCHAR2(50) NOT NULL,
	Zip				CHAR(5) NOT NULL,
	Phone			CHAR(12) NOT NULL,
	DOB				DATE NOT NULL,
	GENDER			CHAR(1) NOT NULL,
		CONSTRAINT tblCustomer_CustomerID_pk PRIMARY KEY(CustomerID)
);

/* Create table tblMovie */

CREATE TABLE tblMovie (
	MovieID				NUMBER(6),
	MovieName			VARCHAR2(100),
	GenreID				CHAR(1),
	MovieReleaseDate	DATE,
	MovieDistributor	VARCHAR2(50),
		CONSTRAINT tblMovie_MovieID_pk PRIMARY KEY(MovieID),
		CONSTRAINT tblMovie_GenreID_fk FOREIGN KEY(GenreID)
			REFERENCES tblGenre(GenreID)
);

/* Create table tblGenre */

CREATE TABLE tblGenre (
	GenreID			CHAR(1),
	GenreName		VARCHAR2(12)
);

/* Create table tblRental */

CREATE TABLE tblRental (
	CustomerID      NUMBER(6),
	MovieID         NUMBER(6),
	RentalDate		DATE NOT NULL,
	ReturnDate		DATE NOT NULL,
		CONSTRAINT tblRental_CustomerID_fk FOREIGN KEY(CustomerID)
			REFERENCES tblCustomer(CustomerID),
		CONSTRAINT tblRental_MovieID_fk FOREIGN KEY(MovieID)
			REFERENCES tblMovie(MovieID)
);




