/* 
Script Name:  Chapter 4 City Jail
Developer:    Tu Tong
Date:         September 26, 2017
Purpose:      Adding constraints to existing tables
              which are created in chapter 3
*/

/**********************************/
/********** DROP TABLES ***********/
/**********************************/

DROP TABLE Appeals;
DROP TABLE Crime_charges;
DROP TABLE Crime_officers;

/**********************************/
/********** PRIMARY KEYS **********/
/**********************************/

/* Add primary key to table Aliases */
ALTER TABLE Aliases
  ADD CONSTRAINT Aliases_Alias_ID_pk PRIMARY KEY(Alias_ID);

/* Add primary key to table Criminal */
ALTER TABLE Criminals
  ADD CONSTRAINT Criminals_Criminal_ID_pk PRIMARY KEY(Criminal_ID);

/* Add primary key to table Crimes */
ALTER TABLE Crimes
  ADD CONSTRAINT Crimes_Crime_ID_pk PRIMARY KEY(Crime_ID);

/* Add primary key to table Sentences */
ALTER TABLE Sentences
  ADD CONSTRAINT Sentences_Sentence_ID_pk PRIMARY KEY(Sentence_ID);

/* Add primary key to table Prob officers */
ALTER TABLE Prob_officers
  ADD CONSTRAINT Prob_officers_Prob_ID_pk PRIMARY KEY(Prob_ID);

/* Add primary key to table Officers */
ALTER TABLE Officers
  ADD CONSTRAINT Officers_Officer_ID_pk PRIMARY KEY(Officer_ID);

/* Add primary key to table Crime code */
ALTER TABLE Crime_codes
  ADD CONSTRAINT Crime_codes_Crime_code_pk PRIMARY KEY(Crime_code);

/**********************************/
/********** FOREIGN KEYS **********/
/**********************************/

/* Add foreign key to table Aliases */
ALTER TABLE Aliases
  ADD CONSTRAINT Aliases_Criminal_ID_fk FOREIGN KEY(Criminal_ID)
  REFERENCES Criminals(Criminal_ID);

/* Add foreign key to table Crimes */
ALTER TABLE Crimes
  ADD CONSTRAINT Crimes_Criminal_ID_fk FOREIGN KEY(Criminal_ID)
  REFERENCES Criminals(Criminal_ID);

/* Add Criminal_ID foreign key to table Sentence */
ALTER TABLE Sentences
  ADD CONSTRAINT Sentences_Criminal_ID_fk FOREIGN KEY(Criminal_ID)
  REFERENCES Criminals(Criminal_ID);

/* Add Prob_ID foreign key to table Sentence */
ALTER TABLE Sentences
  ADD CONSTRAINT Sentences_Prob_ID_fk FOREIGN KEY(Prob_ID)
  REFERENCES Prob_officers(Prob_ID);

/***************************************/
/********** CHECK CONSTRAINTS **********/
/***************************************/

/* Add V_status check constraint to table Criminals */
ALTER TABLE Criminals
  ADD CONSTRAINT Criminals_V_status_ck CHECK (V_status IN ('Y', 'N'));

/* Add P_status check constraint to table Criminals */
ALTER TABLE Criminals
  ADD CONSTRAINT Criminals_P_status_ck CHECK (P_status IN ('Y', 'N'));

/* Add Classicfication check constraint to table Crimes */
ALTER TABLE Crimes
  ADD CONSTRAINT Crimes_Classicfication_ck CHECK (Classification IN ('F', 'M', 'O', 'U'));

/* Add Status check constraint to table Crimes */
ALTER TABLE Crimes
  ADD CONSTRAINT Crimes_Status_ck CHECK (Status IN ('CL', 'CA', 'IA'));

/* Add check constraint to table Sentences */
ALTER TABLE Sentences
  ADD CONSTRAINT Sentences_Type_ck CHECK (Type IN ('J', 'H', 'P'));

/* Add check constraint to table Pro Officers */
ALTER TABLE Prob_officers
  ADD CONSTRAINT Prob_officers_Status_ck CHECK (Status IN ('A', 'I'));

/* Add check constraint to table Officers */
ALTER TABLE Officers
  ADD CONSTRAINT Officers_Status_ck CHECK (Status IN ('A', 'I'));

/********************************************************/
/********** CREATE TABLE WITH CONSTRAINTS KEYS **********/
/********************************************************/

/* Create table Crime Charges */
CREATE TABLE Crime_charges (
  Charge_ID     NUMBER(10,0),   -- primary key
  Crime_ID      NUMBER(9,0),    -- foreign key
  Crime_code    NUMBER(3,0),    -- foreign key
  Charge_status CHAR(2) DEFAULT 'PD',
  Fine_amount   NUMBER(7,2),
  Court_fee     NUMBER(7,2),
  Amount_paid   NUMBER(7,2),
  Pay_due_date  DATE,

    /* Table name is too long. Uses 'Cri_chr' */
    CONSTRAINT Crime_charges_Charge_ID_pk PRIMARY KEY(Charge_ID),
    CONSTRAINT Crime_charges_Crime_ID_fk FOREIGN KEY(Crime_ID)
      REFERENCES Crimes(Crime_ID),
    CONSTRAINT Crime_charges_Crime_code_fk FOREIGN KEY(Crime_code)
      REFERENCES Crime_codes(Crime_code),
    CONSTRAINT Crime_charges_Charge_status_ck CHECK (Charge_status IN ('PD', 'GL', 'NG'))
);


/* Create table Crime officers */
CREATE TABLE Crime_officers (
  Crime_ID        NUMBER(9,0),    -- foreign key
  Officer_ID      NUMBER(8,0),    -- foreign key

    /* Table name is too long. Uses 'Cri_off' */
    CONSTRAINT Crime_Officer_Crime_ID_fk FOREIGN KEY(Crime_ID)
      REFERENCES Crimes(Crime_ID),
    CONSTRAINT Crime_Officer_Officer_ID_fk FOREIGN KEY(Officer_ID)
      REFERENCES Officers(Officer_ID),
    CONSTRAINT Crime_Officers_pk PRIMARY KEY(Crime_ID, Officer_ID)
);

/* Create table Appeals */
CREATE TABLE Appeals (
  Appeal_ID       NUMBER(5),      -- primary key
  Crime_ID        NUMBER(9,0),    -- foreign key
  Filing_Date     DATE,
  Hearing_Date    DATE,
  Status          CHAR(1) DEFAULT 'P',
    CONSTRAINT Appeals_Appeal_ID_pk PRIMARY KEY(Appeal_ID),
    CONSTRAINT Appeals_Crime_ID_fk FOREIGN KEY(Crime_ID)
      REFERENCES Crimes(Crime_ID),
    CONSTRAINT Appeals_Status_ck CHECK (Status IN ('P', 'A', 'D'))
);
