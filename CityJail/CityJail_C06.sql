/* 
Script Name:  Chapter 6 City Jail
Developer:    Tu Tong
Date:         October 26, 2017
Purpose:      Adding sequences, indexes and synonyms
              to city jail database
*/

SELECT * FROM criminals;
  
SELECT * FROM crimes;

-- Display inserted sequences
SELECT * FROM user_sequences;

-- Display inserted indexes
SELECT * FROM user_indexes;

-- Display created synonyms
SELECT * FROM user_synonyms;

/***********************************/
/******** Create Sequences *********/
/***********************************/

/* Generate a sequence for criminal id
which start at 1031, because the last id is 1030
*/
CREATE SEQUENCE criminals_criminal_id_seq
  INCREMENT BY 1
  START WITH 1031
  NOCACHE
  NOCYCLE;
  
/* Generate a sequence for crime id
which start at 10095, because the last id is 10094
*/
CREATE SEQUENCE crimes_crime_id_seq
  INCREMENT BY 1
  START WITH 10095
  NOCACHE
  NOCYCLE;

-- Add a criminal name 'Johnny Capps'
INSERT INTO criminals (criminal_id, last, first, street, city, state, zip, phone, v_status, p_status)
  VALUES (criminals_criminal_id_seq.NEXTVAL, 'Capps','Jonny',
          '123 Main St', 'Northborough', 'MA', '89510', 7576538484, 'Y', 'N');

-- Add a crime to current criminal_id
INSERT INTO crimes (crime_id, criminal_id, classification, date_charged, status, hearing_date, appeal_cut_date)
  VALUES (crimes_crime_id_seq.NEXTVAL, 
          criminals_criminal_id_seq.CURRVAL, 
          'M', '20-OCT-08', 'CL', '05-DEC-08', NULL);

/***********************************/
/********** B-Tree Indexes *********/
/***********************************/

-- create index object for last name column of the Criminal table
CREATE INDEX criminals_last_idx
  ON criminals (last);

-- create index object for street column of the Criminal table
CREATE INDEX criminals_street_idx
  ON criminals (street);
  
-- create index object for phone column of the Crimnial table
CREATE INDEX criminials_phone_idx
  ON criminals (phone);

/***********************************/
/********** BITMAP Indexes *********/
/***********************************/

CREATE BITMAP INDEX criminals_v_status_idx
  ON criminals (v_status);
  
CREATE BITMAP INDEX criminals_p_status_idx
  ON criminals (p_status);
  
CREATE BITMAP INDEX crimies_classicfication_idx
  ON crimes (classification);

CREATE BITMAP INDEX crimies_status_idx
  ON crimes (status);
  
CREATE BITMAP INDEX sentences_type_idx
  ON sentences (type);

CREATE BITMAP INDEX prob_officers_status_idx
  ON prob_officers (status);
  
CREATE BITMAP INDEX crime_charges_charge_status_idx
  ON crime_charges (charge_status);
  
CREATE BITMAP INDEX officers_status_idx
  ON officers (status);
  
CREATE BITMAP INDEX appeals_status_idx
  ON appeals (status);
