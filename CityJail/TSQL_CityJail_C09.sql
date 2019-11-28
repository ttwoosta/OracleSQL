
USE [CityJail]

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
  
SELECT (c.last + ', ' + c.first) AS name, s.start_date, s.end_date, p.con_freq
  FROM dbo.criminals c INNER JOIN dbo.sentences s ON c.criminal_id = s.criminal_id
       INNER JOIN dbo.prob_officers o ON o.prob_id = s.prob_id
       JOIN prob_contact p ON (s.end_date - s.start_date) BETWEEN p.low_amt AND p.high_amt
  ORDER BY name, s.start_date;

SELECT (c.last + ', ' + c.first) AS name, s.start_date, s.end_date, p.con_freq
  FROM criminals c, sentences s, prob_officers o, prob_contact p
  WHERE c.criminal_id = s.criminal_id
    AND s.prob_id = o.prob_id
    AND (s.end_date - s.start_date) BETWEEN p.low_amt AND p.high_amt
  ORDER BY name;