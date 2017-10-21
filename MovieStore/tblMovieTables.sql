/* Create table tblCustomer */
CREATE TABLE tblCustomer (
	CustomerID		NUMBER(6),
	FirstName		VARCHAR2(20) NOT NULL,
	LastName		VARCHAR2(20) NOT NULL,
	Address			VARCHAR2(50) NOT NULL,
	Zip				CHAR(5) NOT NULL,
	Phone			CHAR(12) NOT NULL,
	DOB				DATE NOT NULL,
	GENDER			CHAR(1) NOT NULL
);

/* Add primary_key to the table Customer */
ALTER TABLE tblCustomer
	ADD CONSTRAINT tblCustomer_CustomerID_pk PRIMARY KEY(CustomerID);

/* Create table tblMovie */
CREATE TABLE tblMovie (
	MovieID				NUMBER(6),
	MovieName			VARCHAR2(100),
	MovieGenre			VARCHAR2(50),
	MovieReleaseDate	DATE,
	MovieDistributor	VARCHAR2(50)
);

/* Add primary key to the table Movie */
ALTER TABLE tblMovie
	ADD CONSTRAINT tblMovie_MovieID_pk PRIMARY KEY(MovieID);


/* Create table tblRental */
CREATE TABLE tblRental (
	CustomerID      NUMBER(6),
	MovieID         NUMBER(6),
	RentalDate		DATE NOT NULL,
	ReturnDate		DATE NOT NULL
);

/* Modify table Rental to add foreign keys */
ALTER TABLE tblRental
	ADD CONSTRAINT tblRental_CustomerID_fk FOREIGN KEY(CustomerID)
		REFERENCES tblCustomer(CustomerID);
ALTER TABLE tblRental
	ADD CONSTRAINT tblRental_MovieID_fk FOREIGN KEY(MovieID)
		REFERENCES tblMovie(MovieID);
ALTER TABLE tblRental
	ADD CONSTRAINT tblRental_ReturnDate_ck CHECK (RentalDate <= ReturnDate);




