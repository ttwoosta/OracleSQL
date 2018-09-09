/* 
Script Name:  Chapter 10 City Jail
Developer:    Tu Tong
Date:         November 29, 2017
Purpose:      Select Single Row Functions
*/

/*
1. List the following information for all crimes that have a period greater than
14 days between the date charged and the hearing date: crime ID, classification,
date charged, hearing date, and number of days between the date charged and the
hearing date.
*/
SELECT crime_id, classification, date_charged, hearing_date,
       (hearing_date - date_charged) AS waiting_peiod
  FROM crimes
  WHERE (hearing_date - date_charged) > 14;
  
/*
2. Produce a list showing each active police officer and his or her community 
assignment, indicated by the second letter of the precinct code. Display the 
community description listed in the following chart, based on the second letter
of the precinct code.
*/
SELECT officer_id, (first||' '||last) AS name, status,
       DECODE(SUBSTR(precinct, 2, 1), 'A', 'Shady Grove',
                                      'B', 'Center City',
                                      'C', 'Bay Landing') "Community Assignment"
  FROM officers
  WHERE status = 'A';
  
/*
3. Produce a list of sentencing information to include criminal ID, name 
(displayed in all uppercase letters), sentence ID, sentence start date, and 
length in months of the sentence. The number of months should be shown as a 
whole number. The start date should be displayed in the format 
"December 17, 2009."
*/
SELECT criminal_id, UPPER(c.first || ' ' || c.last) AS name, 
       s.sentence_id, TO_CHAR(s.start_date, 'Month DD, YYYY') AS start_date,
       ROUND(MONTHS_BETWEEN(s.end_date, s.start_date), 0) AS number_of_months
  FROM criminals c JOIN sentences s USING (criminal_id);

/*
4. A list of all amounts owed is needed. Create a list showing each criminal 
name, charge ID, total amount owed (fine amount plus court fee), amount paid, 
amount owed, and payment due date. If nothing has been paid to date, the amount
paid is NULL. Include only criminals who owe some amount of money. Display the
dollar amounts with a dollar sign and two decimals.
*/

SELECT (c.first || ' ' || c.last) AS name, e.charge_id, e.fine_amount, e.court_fee,
       TO_CHAR(e.fine_amount + e.court_fee, '$999,999.99') AS total_amount_owed,
       TO_CHAR(NVL(e.amount_paid, 0), '$999,999.99') AS amount_paid,
       TO_CHAR(e.fine_amount + e.court_fee - NVL(e.amount_paid, 0), 
               '$999,999.99') AS amount_owed,
       e.pay_due_date
  FROM criminals c JOIN crimes r USING(criminal_id)
       JOIN crime_charges e USING(crime_id)
  WHERE e.fine_amount IS NOT NULL OR
        e.court_fee IS NOT NULL OR
        (fine_amount + court_fee) > amount_paid;
        
/*
5. Display the criminal name and probation start date for all criminals who have
a probation period greater than two months. Also, display the date that's two 
months from the beginning of the probation period which will serve as a review date.
*/
SELECT criminal_id, UPPER(c.first || ' ' || c.last) AS name, 
       s.start_date, ADD_MONTHS(s.start_date, 2) AS review_date       
  FROM criminals c JOIN sentences s USING (criminal_id)
  WHERE MONTHS_BETWEEN(s.end_date, s.start_date) > 2;

/*
6. An INSERT statement is needed to support users adding a new appeal. Create an
INSERT statement using substitution variables. Note that users will be entering 
dates in the format of a two-digit month, a two-digit day, and a four-digit year, 
such as "12 17 2009". In addition, a sequence named APPEALS_ID_SEQ exists to 
supply values for the Appeal_ID column, and the default setting for the Status 
column should take effect (that is, the DEFAULT option on the column should be 
used). Test the statement by adding the following appeal: crime_ID = 2534,4031,
filing date = 02 13 2009, and hearing date = 02 27 2009.
*/
INSERT INTO appeals (appeal_id, crime_id, filing_date, hearing_date)
  VALUES (appeals_id_seq.NEXTVAL, 25344031, 
          TO_DATE('02 13 2009', 'MM DD YYYY'), 
          TO_DATE('02 27 2009', 'MM DD YYYY'));
