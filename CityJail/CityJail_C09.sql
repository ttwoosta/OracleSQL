/* 
Script Name:  Chapter 9 City Jail
Developer:    Tu Tong
Date:         November 2, 2017
Purpose:      Joining Data from Multiple Tables
*/

/*
For each request, include one solution using the traditional method and one 
using an ANSI JOIN statement.
*/

/*
1. List all criminals along with the crime charges filed. The report needs to
include the criminal ID, name, crime code, and fine amount.
*/
SELECT c.criminal_id, (c.last||', '||c.first) AS name, g.crime_code, g.fine_amount
  FROM criminals c, crimes r, crime_charges g
  WHERE c.criminal_id = r.criminal_id
    AND r.crime_id = g.crime_id;
  
SELECT criminal_id, (c.last||', '||c.first) AS name, g.crime_code, g.fine_amount
  FROM criminals c JOIN crimes r USING (criminal_id)
       JOIN crime_charges g USING (crime_id);

/*
2. List all criminals along with crime status and appeal status (if applicable).
The resports need to include the criminal ID, name, crime classification, date
charged, appeal filing date, and appeal status. Show all criminals, regardless
of whether they have filed an appeal.
*/
SELECT c.criminal_id, (c.last||', '||c.first) AS name, 
       r.classification, r.date_charged,
       a.filing_date, a.status
  FROM criminals c, crimes r, appeals a
  WHERE c.criminal_id = r.criminal_id
    AND r.crime_id = a.crime_id(+);
    
SELECT criminal_id, (c.last||', '||c.first) AS name, 
       r.classification, r.date_charged,
       a.filing_date, a.status
  FROM criminals c JOIN crimes r USING (criminal_id)
       LEFT OUTER JOIN appeals a USING (crime_id);

/*
3. List all criminals along with crime information. The report needs to include
the criminal ID, name, crime classification, date charged, crime code, and fine
amount. Include only crimes classified as "Other." Sort the list by criminal ID,
and date charged.
*/
SELECT c.criminal_id, r.classification, r.date_charged, e.crime_code, e.fine_amount
  FROM criminals c, crimes r, crime_charges e
  WHERE c.criminal_id = r.criminal_id
    AND r.crime_id = e.crime_id
    AND r.classification = 'O'
  ORDER BY c.criminal_id, r.date_charged;

SELECT criminal_id, r.classification, r.date_charged, e.crime_code, e.fine_amount
  FROM criminals c JOIN crimes r USING (criminal_id)
       JOIN crime_charges e USING (crime_id)
  WHERE r.classification = 'O'
  ORDER BY criminal_id, r.date_charged;
  
/*
4. Create an alphabetical list of all criminals, including criminal ID, name, 
violent offender status, parole status, and any known aliases. 
*/
SELECT c.criminal_id, (c.last||', '||c.first) AS name, a.alias, 
       c.v_status, c.p_status
  FROM criminals c, aliases a
  WHERE c.criminal_id = a.criminal_id(+)
  ORDER BY name;
  
SELECT criminal_id, (c.last||', '||c.first) AS name, a.alias, 
       c.v_status, c.p_status
  FROM criminals c LEFT OUTER JOIN aliases a 
       USING (criminal_id)
  ORDER BY name;

/*
5. A table named Prob_Contact contains the required frequency of contact with a
probation officer, based on the length of the probation period (the number of 
days assigned to probation). Review the data in this table, which indicates
ranges for the number of days and applicable contact frequencies. Create a list
containing the name of each criminal who has been assigned a probation period,
which is indicated by the sentence type. The list should contain the criminal
name, probation start date, probation end date, and required frequency of contact.
Sort the list by criminal name and probation start date.
*/
SELECT (c.last||', '||c.first) AS name, s.start_date, s.end_date, p.con_freq
  FROM criminals c, sentences s, prob_officers o, prob_contact p
  WHERE c.criminal_id = s.criminal_id
    AND s.prob_id = o.prob_id
    AND (s.end_date - s.start_date) BETWEEN p.low_amt AND p.high_amt
  ORDER BY name, s.start_date;
  
SELECT (c.last||', '||c.first) AS name, s.start_date, s.end_date, p.con_freq
  FROM criminals c JOIN sentences s USING (criminal_id)
       JOIN prob_officers o USING (prob_id)
       NATURAL JOIN prob_contact p
  WHERE (s.end_date - s.start_date) BETWEEN p.low_amt AND p.high_amt
  ORDER BY name, s.start_date;

/*
6. A column named Mgr_ID has beed added to Prob_Officers table and contains the
ID number of the probation supervisor for each officer. Produce a list showing
each probation officer's name and his or her supervisor's name. Sort the list
alphabetically by probation officer name.
*/
SELECT o.prob_id, (o.last||', '||o.first) AS name, o.mgr_id,
       (s.last||', '||s.first) AS supervisor_name
  FROM prob_officers o, prob_officers s
  WHERE o.mgr_id = s.prob_id(+)
  ORDER BY name;
  

