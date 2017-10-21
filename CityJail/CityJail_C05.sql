/* 
Script Name:  Chapter 5 City Jail
Developer:    Tu Tong
Date:         October 13, 2017
Purpose:      Adding constraints to existing tables
              which are created in chapter 3
*/

/**********************************/
/* 1. Create and execute statements to perform 
  the following DML activities. 
  Save the changes permanently to the database */
/**********************************/

/* Add the following criminals */
INSERT INTO criminals (criminal_id, last, first, street, city, state, zip, phone, v_status, p_status)
  VALUES (1015, 'Fenter', 'Jim', NULL, 'Chesapeake', 'VA', 23320, NULL, 'N', 'N');
  
INSERT INTO criminals (criminal_id, last, first, street, city, state, zip, phone, v_status, p_status)
  VALUES (1016, 'Sauder', 'Bill', '11 Apple Rd', 'Virginia Beach', 'VA', 23455, 7678217443, 'N', 'N');
  
INSERT INTO criminals (criminal_id, last, first, street, city, state, zip, phone, v_status, p_status)
  VALUES (1017, 'Painter', 'Troy', '77 Ship Lane', 'Norfolk', 'VA', 22093, 7677655454, 'N', 'N')
  
/* Add a column Mail_flag to the CRIMINALS table.
  The column should be assigned a datatype of CHAR(1) */
ALTER TABLE criminals
  INSERT (mail_flag CHAR(1));
  
/* Set the Mail_flag column to a value of 'Y' for all criminals */
UPDATE criminals
  SET mail_flag = 'Y';
  
/* Set the Mail_flag column to a value of 'N' for all criminals
  who don't have a street address recorded in the database */
UPDATE criminals
  SET mail_flag = 'N'
  WHERE street = NULL;
  
/* Change the phone number for criminal 1016 to 7225659032 */
UPDATE criminals
  SET phone = 7225659032
  WHERE criminal_id = 1016;
  
/* Remove criminal 1017 from the database */
DELETE FROM criminals
  WHERE criminal_id = 1017;
  
/**********************************/
/* Execute a DML statement to accomplish each of the 
following actions. Each statement produces a constraint error. 
Document the error number and message, and briefly explain 
the cause of the error. If your statement generates a syntax error
rather than a constraint violation error, revise your statement 
to correct any syntax errors. You can review the 
CityJail_5.sql file to identify table constraints.*/
/**********************************/

-- Add a crime record with id 100
INSERT INTO crimes (crime_id, criminal_id, classification, date_charged, status)
  VALUES (100, 1010, 'M', 'JUL-15-2009', 'PD');
 
-- Add a crime record with id 130
INSERT INTO crimes (crime_id, criminal_id, classification, date_charged, status)
  VALUES (130, 1016, 'M', 'JUL-15-2009', 'PD');
  
-- Add a crime record with id 130
INSERT INTO crimes (crime_id, criminal_id, classification, date_charged, status)
  VALUES (130, 1016, 'P', 'JUL-15-2009', 'CL');