--DROP TABLE aliases CASCADE CONSTRAINTS;

--DROP TABLE criminals CASCADE CONSTRAINTS;

--DROP TABLE crimes CASCADE CONSTRAINTS;

--DROP TABLE appeals CASCADE CONSTRAINTS;

--DROP TABLE officers CASCADE CONSTRAINTS;

--DROP TABLE crime_officers CASCADE CONSTRAINTS;

--DROP TABLE crime_charges CASCADE CONSTRAINTS;

--DROP TABLE crime_codes CASCADE CONSTRAINTS;

--DROP TABLE prob_officers CASCADE CONSTRAINTS;

--DROP TABLE sentences CASCADE CONSTRAINTS;

--CALL DropSequence('appeals_id_seq');

--DROP TABLE prob_contact CASCADE CONSTRAINTS;

CREATE TABLE aliases (
	alias_id INT,
	criminal_id INT,
	alias VARCHAR(10)
	);

CREATE TABLE criminals (
	criminal_id INT NOT NULL PRIMARY KEY,
	last VARCHAR(15),
	first VARCHAR(10),
	street VARCHAR(30),
	city VARCHAR(20),
	STATE CHAR(2),
	zip CHAR(5),
	phone CHAR(10),
	v_status CHAR(1) DEFAULT 'N',
	p_status CHAR(1) DEFAULT 'N'
	);

CREATE TABLE crimes (
	crime_id BIGINT PRIMARY KEY,
	criminal_id INT NOT NULL,
	classification CHAR(1),
	date_charged DATETIME,
	STATUS CHAR(2),
	hearing_date DATETIME,
	appeal_cut_date DATETIME
	);

CREATE TABLE sentences (
	sentence_id INT,
	criminal_id INT,
	type CHAR(1),
	prob_id INT,
	start_date DATETIME,
	end_date DATETIME,
	violations SMALLINT
	);

CREATE TABLE prob_officers (
	prob_id INT,
	last VARCHAR(15),
	first VARCHAR(10),
	street VARCHAR(30),
	city VARCHAR(20),
	STATE CHAR(2),
	zip CHAR(5),
	phone CHAR(10),
	email VARCHAR(30),
	STATUS CHAR(1) DEFAULT 'A',
	mgr_id INT DEFAULT NULL
	);

CREATE TABLE crime_charges (
	charge_id BIGINT,
	crime_id BIGINT,
	crime_code SMALLINT,
	charge_status CHAR(2),
	fine_amount DECIMAL(7, 2),
	court_fee DECIMAL(7, 2),
	amount_paid DECIMAL(7, 2),
	pay_due_date DATETIME
	);

CREATE TABLE crime_officers (
	crime_id BIGINT,
	officer_id INT
	);

CREATE TABLE officers (
	officer_id INT,
	last VARCHAR(15),
	first VARCHAR(10),
	precinct CHAR(4),
	badge VARCHAR(14),
	phone CHAR(10),
	STATUS CHAR(1) DEFAULT 'A'
	);

CREATE TABLE appeals (
	appeal_id INT,
	crime_id BIGINT,
	filing_date DATETIME,
	hearing_date DATETIME,
	STATUS CHAR(1) DEFAULT 'P'
	);

CREATE TABLE crime_codes (
	crime_code SMALLINT,
	code_description VARCHAR(30)
	);

--ALTER TABLE crimes ALTER COLUMN classification CHAR(1) DEFAULT 'U';

--ALTER TABLE crimes ADD date_recorded DATE DEFAULT SYSDATE();

ALTER TABLE prob_officers ADD pager# CHAR(10);

ALTER TABLE aliases ALTER COLUMN alias NVARCHAR(20);

--DROP TABLE criminals CASCADE CONSTRAINTS;

--DROP TABLE crimes CASCADE CONSTRAINTS;



--ALTER TABLE crimes ALTER COLUMN (classification DEFAULT 'U');

--ALTER TABLE crimes ADD date_recorded DATE DEFAULT SYSDATE());

--ALTER TABLE criminals ADD CONSTRAINT criminals_id_pk PRIMARY KEY (criminal_id);

ALTER TABLE criminals ADD CONSTRAINT criminals_vstatus_ck CHECK (
	v_status IN (
		'Y',
		'N'
		)
	);

ALTER TABLE criminals ADD CONSTRAINT criminals_pstatus_ck CHECK (
	p_status IN (
		'Y',
		'N'
		)
	);

--ALTER TABLE crimes ADD CONSTRAINT crimes_id_pk PRIMARY KEY (crime_id);

ALTER TABLE crimes ADD CONSTRAINT crimes_class_ck CHECK (
	classification IN (
		'F',
		'M',
		'O',
		'U'
		)
	);

ALTER TABLE crimes ADD CONSTRAINT crimes_status_ck CHECK (
	STATUS IN (
		'CL',
		'CA',
		'IA'
		)
	);

ALTER TABLE crimes ADD CONSTRAINT crimes_criminalid_fk FOREIGN KEY (criminal_id) REFERENCES criminals (criminal_id);

ALTER TABLE crimes ALTER COLUMN criminal_id INT NOT NULL;

INSERT INTO crime_codes
VALUES (
	301,
	'Agg Assault'
	);

INSERT INTO crime_codes
VALUES (
	302,
	'Auto Theft'
	);

INSERT INTO crime_codes
VALUES (
	303,
	'Burglary-Business'
	);

INSERT INTO crime_codes
VALUES (
	304,
	'Criminal Mischief'
	);

INSERT INTO crime_codes
VALUES (
	305,
	'Drug Offense'
	);

INSERT INTO crime_codes
VALUES (
	306,
	'Bomb Threat'
	);

--DESC prob_officers;

INSERT INTO prob_officers (
	prob_id,
	last,
	first,
	city,
	STATUS,
	mgr_id
	)
VALUES (
	100,
	'Peek',
	'Susan',
	'Virginia Beach',
	'A',
	NULL
	);

INSERT INTO prob_officers (
	prob_id,
	last,
	first,
	city,
	STATUS,
	mgr_id
	)
VALUES (
	102,
	'Speckle',
	'Jeff',
	'Virginia Beach',
	'A',
	100
	);

INSERT INTO prob_officers (
	prob_id,
	last,
	first,
	city,
	STATUS,
	mgr_id
	)
VALUES (
	104,
	'Boyle',
	'Chris',
	'Virginia Beach',
	'A',
	100
	);

INSERT INTO prob_officers (
	prob_id,
	last,
	first,
	city,
	STATUS,
	mgr_id
	)
VALUES (
	106,
	'Taps',
	'George',
	'Chesapeake',
	'A',
	NULL
	);

INSERT INTO prob_officers (
	prob_id,
	last,
	first,
	city,
	STATUS,
	mgr_id
	)
VALUES (
	108,
	'Ponds',
	'Terry',
	'Chesapeake',
	'A',
	106
	);

INSERT INTO prob_officers (
	prob_id,
	last,
	first,
	city,
	STATUS,
	mgr_id
	)
VALUES (
	110,
	'Hawk',
	'Fred',
	'Chesapeake',
	'I',
	106
	);

INSERT INTO officers (
	officer_id,
	last,
	first,
	precinct,
	badge,
	phone,
	STATUS
	)
VALUES (
	111112,
	'Shocks',
	'Pam',
	'OCVW',
	'E5546A33',
	'7574446767',
	'A'
	);

INSERT INTO officers (
	officer_id,
	last,
	first,
	precinct,
	badge,
	phone,
	STATUS
	)
VALUES (
	111113,
	'Busey',
	'Gerry',
	'GHNT',
	'E5577D48',
	'7574446767',
	'A'
	);

INSERT INTO officers (
	officer_id,
	last,
	first,
	precinct,
	badge,
	phone,
	STATUS
	)
VALUES (
	111114,
	'Gants',
	'Dale',
	'SBCH',
	'E5536N02',
	'7574446767',
	'A'
	);

INSERT INTO officers (
	officer_id,
	last,
	first,
	precinct,
	badge,
	phone,
	STATUS
	)
VALUES (
	111115,
	'Hart',
	'Leigh',
	'WAVE',
	'E5511J40',
	'7574446767',
	'A'
	);

INSERT INTO officers (
	officer_id,
	last,
	first,
	precinct,
	badge,
	phone,
	STATUS
	)
VALUES (
	111116,
	'Sands',
	'Ben',
	'OCVW',
	'E5588R00',
	'7574446767',
	'I'
	);

COMMIT;

INSERT INTO criminals (
	criminal_id,
	last,
	first,
	street,
	city,
	STATE,
	zip,
	phone,
	v_status,
	p_status
	)
VALUES (
	1020,
	'Phelps',
	'Sam',
	'1105 Tree Lane',
	'Virginia Beach',
	'VA',
	'23510',
	7576778484,
	'Y',
	'N'
	);

INSERT INTO crimes (
	crime_id,
	criminal_id,
	classification,
	date_charged,
	STATUS,
	hearing_date,
	appeal_cut_date
	)
VALUES (
	10085,
	1020,
	'F',
	'03-SEP-08',
	'CA',
	'15-SEP-08',
	'15-DEC-08'
	);

INSERT INTO crime_charges (
	charge_id,
	crime_id,
	crime_code,
	charge_status,
	fine_amount,
	court_fee,
	amount_paid,
	pay_due_date
	)
VALUES (
	5000,
	10085,
	301,
	'GL',
	3000,
	200,
	40,
	'15-OCT-08'
	);

INSERT INTO crime_charges (
	charge_id,
	crime_id,
	crime_code,
	charge_status,
	fine_amount,
	court_fee,
	amount_paid,
	pay_due_date
	)
VALUES (
	5001,
	10085,
	305,
	'GL',
	1000,
	100,
	NULL,
	'15-OCT-08'
	);

INSERT INTO sentences (
	sentence_id,
	criminal_id,
	type,
	prob_id,
	start_date,
	end_date,
	violations
	)
VALUES (
	1000,
	1020,
	'J',
	NULL,
	'15-SEP-08',
	'15-SEP-10',
	0
	);

INSERT INTO aliases (
	alias_id,
	criminal_id,
	alias
	)
VALUES (
	100,
	1020,
	'Bat'
	);

INSERT INTO crime_officers (
	crime_id,
	officer_id
	)
VALUES (
	10085,
	111112
	);

INSERT INTO criminals (
	criminal_id,
	last,
	first,
	street,
	city,
	STATE,
	zip,
	phone,
	v_status,
	p_status
	)
VALUES (
	1021,
	'Sums',
	'Tammy',
	'22 E. Ave',
	'Virginia Beach',
	'VA',
	'23510',
	7575453390,
	'N',
	'Y'
	);

INSERT INTO crimes (
	crime_id,
	criminal_id,
	classification,
	date_charged,
	STATUS,
	hearing_date,
	appeal_cut_date
	)
VALUES (
	10086,
	1021,
	'M',
	'20-OCT-08',
	'CL',
	'05-DEC-08',
	NULL
	);

INSERT INTO crime_charges (
	charge_id,
	crime_id,
	crime_code,
	charge_status,
	fine_amount,
	court_fee,
	amount_paid,
	pay_due_date
	)
VALUES (
	5002,
	10086,
	304,
	'GL',
	200,
	100,
	25,
	'15-FEB-09'
	);

INSERT INTO sentences (
	sentence_id,
	criminal_id,
	type,
	prob_id,
	start_date,
	end_date,
	violations
	)
VALUES (
	1001,
	1021,
	'P',
	102,
	'05-DEC-08',
	'05-JUN-09',
	0
	);

INSERT INTO crime_officers (
	crime_id,
	officer_id
	)
VALUES (
	10086,
	111114
	);

INSERT INTO criminals (
	criminal_id,
	last,
	first,
	street,
	city,
	STATE,
	zip,
	phone,
	v_status,
	p_status
	)
VALUES (
	1022,
	'Caulk',
	'Dave',
	'8112 Chester Lane',
	'Chesapeake',
	'VA',
	'23320',
	7578403690,
	'N',
	'Y'
	);

INSERT INTO crimes (
	crime_id,
	criminal_id,
	classification,
	date_charged,
	STATUS,
	hearing_date,
	appeal_cut_date
	)
VALUES (
	10087,
	1022,
	'M',
	'30-OCT-08',
	'IA',
	'05-DEC-08',
	'15-MAR-09'
	);

INSERT INTO crime_charges (
	charge_id,
	crime_id,
	crime_code,
	charge_status,
	fine_amount,
	court_fee,
	amount_paid,
	pay_due_date
	)
VALUES (
	5003,
	10087,
	305,
	'GL',
	100,
	50,
	150,
	'15-MAR-09'
	);

INSERT INTO sentences (
	sentence_id,
	criminal_id,
	type,
	prob_id,
	start_date,
	end_date,
	violations
	)
VALUES (
	1002,
	1022,
	'P',
	108,
	'20-MAR-09',
	'20-AUG-09',
	0
	);

INSERT INTO crime_officers (
	crime_id,
	officer_id
	)
VALUES (
	10087,
	111115
	);

INSERT INTO aliases (
	alias_id,
	criminal_id,
	alias
	)
VALUES (
	101,
	1022,
	'Cabby'
	);

INSERT INTO appeals (
	appeal_id,
	crime_id,
	filing_date,
	hearing_date,
	STATUS
	)
VALUES (
	7500,
	10087,
	'10-DEC-08',
	'20-DEC-08',
	'A'
	);

INSERT INTO appeals (
	appeal_id,
	crime_id,
	filing_date,
	hearing_date,
	STATUS
	)
VALUES (
	7501,
	10086,
	'15-DEC-08',
	'20-DEC-08',
	'A'
	);

INSERT INTO appeals (
	appeal_id,
	crime_id,
	filing_date,
	hearing_date,
	STATUS
	)
VALUES (
	7502,
	10085,
	'20-SEP-08',
	'28-OCT-08',
	'A'
	);

INSERT INTO criminals (
	criminal_id,
	last,
	first,
	street,
	city,
	STATE,
	zip,
	phone,
	v_status,
	p_status
	)
VALUES (
	1023,
	'Dabber',
	'Pat',
	NULL,
	'Chesapeake',
	'VA',
	'23320',
	NULL,
	'N',
	'N'
	);

INSERT INTO crimes (
	crime_id,
	criminal_id,
	classification,
	date_charged,
	STATUS,
	hearing_date,
	appeal_cut_date
	)
VALUES (
	10088,
	1023,
	'O',
	'05-NOV-08',
	'CA',
	NULL,
	NULL
	);

INSERT INTO crime_charges (
	charge_id,
	crime_id,
	crime_code,
	charge_status,
	fine_amount,
	court_fee,
	amount_paid,
	pay_due_date
	)
VALUES (
	5004,
	10088,
	306,
	'PD',
	NULL,
	NULL,
	NULL,
	NULL
	);

INSERT INTO crime_officers (
	crime_id,
	officer_id
	)
VALUES (
	10088,
	111115
	);

INSERT INTO criminals (
	criminal_id,
	last,
	first,
	street,
	city,
	STATE,
	zip,
	phone,
	v_status,
	p_status
	)
VALUES (
	1025,
	'Cat',
	'Tommy',
	NULL,
	'Norfolk',
	'VA',
	'26503',
	NULL,
	'N',
	'Y'
	);

INSERT INTO crimes (
	crime_id,
	criminal_id,
	classification,
	date_charged,
	STATUS,
	hearing_date,
	appeal_cut_date
	)
VALUES (
	10089,
	1025,
	'M',
	'22-OCT-08',
	'CA',
	'25-NOV-08',
	'15-FEB-09'
	);

INSERT INTO crime_charges (
	charge_id,
	crime_id,
	crime_code,
	charge_status,
	fine_amount,
	court_fee,
	amount_paid,
	pay_due_date
	)
VALUES (
	5005,
	10089,
	305,
	'GL',
	100,
	50,
	NULL,
	'15-FEB-09'
	);

INSERT INTO sentences (
	sentence_id,
	criminal_id,
	type,
	prob_id,
	start_date,
	end_date,
	violations
	)
VALUES (
	1004,
	1025,
	'P',
	106,
	'20-DEC-08',
	'20-MAR-09',
	0
	);

INSERT INTO crime_officers (
	crime_id,
	officer_id
	)
VALUES (
	10089,
	111115
	);

INSERT INTO crime_officers (
	crime_id,
	officer_id
	)
VALUES (
	10089,
	111116
	);

INSERT INTO criminals (
	criminal_id,
	last,
	first,
	street,
	city,
	STATE,
	zip,
	phone,
	v_status,
	p_status
	)
VALUES (
	1026,
	'Simon',
	'Tim',
	NULL,
	'Norfolk',
	'VA',
	'26503',
	NULL,
	'N',
	'Y'
	);

INSERT INTO crimes (
	crime_id,
	criminal_id,
	classification,
	date_charged,
	STATUS,
	hearing_date,
	appeal_cut_date
	)
VALUES (
	10090,
	1026,
	'M',
	'22-OCT-08',
	'CA',
	'25-NOV-08',
	'15-FEB-09'
	);

INSERT INTO crime_charges (
	charge_id,
	crime_id,
	crime_code,
	charge_status,
	fine_amount,
	court_fee,
	amount_paid,
	pay_due_date
	)
VALUES (
	5006,
	10090,
	305,
	'GL',
	100,
	50,
	NULL,
	'15-FEB-09'
	);

INSERT INTO sentences (
	sentence_id,
	criminal_id,
	type,
	prob_id,
	start_date,
	end_date,
	violations
	)
VALUES (
	1005,
	1026,
	'P',
	106,
	'20-DEC-08',
	'20-MAR-09',
	0
	);

INSERT INTO crime_officers (
	crime_id,
	officer_id
	)
VALUES (
	10090,
	111115
	);

INSERT INTO criminals (
	criminal_id,
	last,
	first,
	street,
	city,
	STATE,
	zip,
	phone,
	v_status,
	p_status
	)
VALUES (
	1027,
	'Pints',
	'Reed',
	NULL,
	'Norfolk',
	'VA',
	'26505',
	NULL,
	'N',
	'Y'
	);

INSERT INTO crimes (
	crime_id,
	criminal_id,
	classification,
	date_charged,
	STATUS,
	hearing_date,
	appeal_cut_date
	)
VALUES (
	10091,
	1027,
	'M',
	'24-OCT-08',
	'CA',
	'28-NOV-08',
	'15-FEB-09'
	);

INSERT INTO crime_charges (
	charge_id,
	crime_id,
	crime_code,
	charge_status,
	fine_amount,
	court_fee,
	amount_paid,
	pay_due_date
	)
VALUES (
	5007,
	10091,
	305,
	'GL',
	100,
	50,
	20,
	'15-FEB-09'
	);

INSERT INTO sentences (
	sentence_id,
	criminal_id,
	type,
	prob_id,
	start_date,
	end_date,
	violations
	)
VALUES (
	1006,
	1027,
	'P',
	106,
	'20-DEC-08',
	'20-MAR-09',
	0
	);

INSERT INTO crime_officers (
	crime_id,
	officer_id
	)
VALUES (
	10091,
	111115
	);

INSERT INTO criminals (
	criminal_id,
	last,
	first,
	street,
	city,
	STATE,
	zip,
	phone,
	v_status,
	p_status
	)
VALUES (
	1028,
	'Mansville',
	'Nancy',
	NULL,
	'Norfolk',
	'VA',
	'26505',
	NULL,
	'N',
	'Y'
	);

INSERT INTO crimes (
	crime_id,
	criminal_id,
	classification,
	date_charged,
	STATUS,
	hearing_date,
	appeal_cut_date
	)
VALUES (
	10092,
	1028,
	'M',
	'24-OCT-08',
	'CA',
	'28-NOV-08',
	'15-FEB-09'
	);

INSERT INTO crime_charges (
	charge_id,
	crime_id,
	crime_code,
	charge_status,
	fine_amount,
	court_fee,
	amount_paid,
	pay_due_date
	)
VALUES (
	5008,
	10092,
	305,
	'GL',
	100,
	50,
	25,
	'15-FEB-09'
	);

INSERT INTO sentences (
	sentence_id,
	criminal_id,
	type,
	prob_id,
	start_date,
	end_date,
	violations
	)
VALUES (
	1007,
	1028,
	'P',
	106,
	'20-DEC-08',
	'20-MAR-09',
	0
	);

INSERT INTO crime_officers (
	crime_id,
	officer_id
	)
VALUES (
	10092,
	111115
	);

INSERT INTO criminals (
	criminal_id,
	last,
	first,
	street,
	city,
	STATE,
	zip,
	phone,
	v_status,
	p_status
	)
VALUES (
	1024,
	'Perry',
	'Cart',
	NULL,
	'Norfolk',
	'VA',
	'26501',
	NULL,
	'N',
	'Y'
	);

INSERT INTO crimes (
	crime_id,
	criminal_id,
	classification,
	date_charged,
	STATUS,
	hearing_date,
	appeal_cut_date
	)
VALUES (
	10093,
	1024,
	'M',
	'22-OCT-08',
	'CA',
	'25-NOV-08',
	'15-FEB-09'
	);

INSERT INTO crime_charges (
	charge_id,
	crime_id,
	crime_code,
	charge_status,
	fine_amount,
	court_fee,
	amount_paid,
	pay_due_date
	)
VALUES (
	5009,
	10093,
	305,
	'GL',
	100,
	50,
	NULL,
	'15-FEB-09'
	);

INSERT INTO sentences (
	sentence_id,
	criminal_id,
	type,
	prob_id,
	start_date,
	end_date,
	violations
	)
VALUES (
	1003,
	1024,
	'P',
	106,
	'20-DEC-08',
	'20-MAR-09',
	1
	);

INSERT INTO crime_officers (
	crime_id,
	officer_id
	)
VALUES (
	10093,
	111115
	);

INSERT INTO criminals (
	criminal_id,
	last,
	first,
	street,
	city,
	STATE,
	zip,
	phone,
	v_status,
	p_status
	)
VALUES (
	1029,
	'Statin',
	'Penny',
	NULL,
	'Norfolk',
	'VA',
	'26505',
	NULL,
	'N',
	'Y'
	);

INSERT INTO crimes (
	crime_id,
	criminal_id,
	classification,
	date_charged,
	STATUS,
	hearing_date,
	appeal_cut_date
	)
VALUES (
	10094,
	1029,
	'M',
	'26-OCT-08',
	'CA',
	'26-NOV-08',
	'17-FEB-09'
	);

INSERT INTO crime_charges (
	charge_id,
	crime_id,
	crime_code,
	charge_status,
	fine_amount,
	court_fee,
	amount_paid,
	pay_due_date
	)
VALUES (
	5010,
	10094,
	305,
	'GL',
	50,
	50,
	NULL,
	'17-FEB-09'
	);

INSERT INTO sentences (
	sentence_id,
	criminal_id,
	type,
	prob_id,
	start_date,
	end_date,
	violations
	)
VALUES (
	1008,
	1029,
	'P',
	106,
	'20-DEC-08',
	'05-FEB-09',
	1
	);

INSERT INTO crime_officers (
	crime_id,
	officer_id
	)
VALUES (
	10094,
	111115
	);

INSERT INTO criminals (
	criminal_id,
	last,
	first,
	street,
	city,
	STATE,
	zip,
	phone,
	v_status,
	p_status
	)
VALUES (
	1030,
	'Panner',
	'Lee',
	NULL,
	'Norfolk',
	'VA',
	'26505',
	NULL,
	'N',
	'Y'
	);

INSERT INTO crimes (
	crime_id,
	criminal_id,
	classification,
	date_charged,
	STATUS,
	hearing_date,
	appeal_cut_date
	)
VALUES (
	25344031,
	1030,
	'M',
	'26-OCT-08',
	'CA',
	'26-NOV-08',
	'17-FEB-09'
	);

INSERT INTO crime_charges (
	charge_id,
	crime_id,
	crime_code,
	charge_status,
	fine_amount,
	court_fee,
	amount_paid,
	pay_due_date
	)
VALUES (
	5011,
	25344031,
	305,
	'GL',
	50,
	50,
	NULL,
	'17-FEB-09'
	);

INSERT INTO sentences (
	sentence_id,
	criminal_id,
	type,
	prob_id,
	start_date,
	end_date,
	violations
	)
VALUES (
	1009,
	1030,
	'P',
	106,
	'20-DEC-08',
	'05-FEB-09',
	1
	);

INSERT INTO crime_officers (
	crime_id,
	officer_id
	)
VALUES (
	25344031,
	111115
	);

INSERT INTO crimes (
	crime_id,
	criminal_id,
	classification,
	date_charged,
	STATUS,
	hearing_date,
	appeal_cut_date
	)
VALUES (
	25344060,
	1030,
	'M',
	'18-NOV-08',
	'CL',
	'26-NOV-08',
	NULL
	);

INSERT INTO crime_charges (
	charge_id,
	crime_id,
	crime_code,
	charge_status,
	fine_amount,
	court_fee,
	amount_paid,
	pay_due_date
	)
VALUES (
	5012,
	25344060,
	305,
	'GL',
	50,
	50,
	100,
	'17-FEB-09'
	);

INSERT INTO sentences (
	sentence_id,
	criminal_id,
	type,
	prob_id,
	start_date,
	end_date,
	violations
	)
VALUES (
	1010,
	1030,
	'P',
	106,
	'06-FEB-09',
	'06-JUL-09',
	0
	);

INSERT INTO crime_officers (
	crime_id,
	officer_id
	)
VALUES (
	25344060,
	111116
	);

COMMIT;
