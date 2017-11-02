/* 
Script Name:  Chapter 8 City Jail
Developer:    Tu Tong
Date:         November 2, 2017
Purpose:      Quering with restricitng rows 
              and sorting data
*/

/*
1. List all criminal aliases beginning with letter B
*/
SELECT *
  FROM aliases
  WHERE alias LIKE 'B%';
  
/*
2. List all crimes that occurred during the month Oct 2008.
List the crime ID, criminal ID, date charged, and classification
*/
SELECT crime_id, criminal_id, date_charged, classification
  FROM crimes
  WHERE date_charged BETWEEN '01-Oct-08' AND '31-Oct-08';
  
/*
3. List all crimes with a status of CA (can appeal) or IA (in appeal). 
List the crime ID, criminal ID, date charged and status
*/
SELECT crime_id, criminal_id, date_charged, status
  FROM crimes
  WHERE status IN('CA', 'IA');

/*
4. List all crimes classified as a felony.
List the crime ID, criminal ID, date charged, and classification.
*/
SELECT crime_id, criminal_id, date_charged, classification
  FROM crimes
  WHERE classification = 'F';
  
/*
5. List all crimes with a hearing date more than 14 days after the date charged.
List the crime ID, criminal ID, date charged, and hearing date.
*/
SELECT crime_id, criminal_id, date_charged, hearing_date
  FROM crimes
  WHERE (hearing_date - date_charged) >= 14;
  
/*
6. List all criminals with the zip code 23510.
List the criminal ID, last name, and zip code.
Sort list by criminal ID.
*/
SELECT criminal_id, last, zip
  FROM criminals
  WHERE zip = 23510
  ORDER BY criminal_id;
  
/*
7. List all crimes that don't have a hearing date scheduled.
List the crime ID, criminal ID, date charged, and hearing date.
*/
SELECT crime_id, criminal_id, date_charged, hearing_date
  FROM crimes
  WHERE hearing_date IS NULL;

/*
8. List all sentences with a probation officer assigned. 
List the sentence ID, criminal ID, and probation officer ID.
Sort the list by probation officer ID and then criminal ID.
*/
SELECT sentence_id, criminal_id, prob_id
  FROM sentences
  WHERE prob_id IS NOT NULL
  ORDER BY prob_id, criminal_id;
  
/*
9. List all crimes that are classified as misdemeanors and 
are currently in appeal. List the crime ID, criminal ID, 
classification, and status.
*/
SELECT crime_id, criminal_id, classification, status
  FROM crimes
  WHERE classification = 'M';

/*
10. List all crime charges with a balance owed. List the charge ID, 
crime ID, fine amount, court fee, amount paid, and amount owed.
*/
SELECT charge_id, crime_id, fine_amount, court_fee, amount_paid, 
       (fine_amount + court_fee - amount_paid) AS amount_owed
  FROM crime_charges
  WHERE amount_paid IS NULL OR 
        (fine_amount + court_fee) > amount_paid;

/*
11. List all police officers who are assigned to the precinct OCVW or GHNT 
and have a status of active. List the officer ID, last name, precinct, 
and status. Sort the list by precinct and then by officer last name.
*/
SELECT officer_id, last, precinct, status
  FROM officers
  WHERE precinct IN('OCVW', 'GHNT') AND status = 'A'
  ORDER BY precinct, last;

