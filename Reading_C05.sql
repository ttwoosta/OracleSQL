SELECT * 
  FROM acctmanager;

DESC acctmanager;

DELETE FROM acctmanager
  WHERE amid = 'L500';
  
INSERT INTO acctmanager
  VALUES ('T500', 'NICK', 'TAYLOR', '05-SEP-09', 42000, 3500, 'NE');
  
INSERT INTO acctmanager (amid, amfirst, amlast, amedate, amsal, amcomm, region)
  VALUES ('L500', 'MANDY', 'LOPEZ', '01-OCT-09', 47000, 1500, NULL);
  
/* A DEFAULT column option setting will be overridden 
when an explicit NULL value is inserted. */
ALTER TABLE acctmanager
  MODIFY (amsal DEFAULT ON NULL 0);
  
INSERT INTO acctmanager (amid, amfirst, amlast, amedate, amsal, amcomm, region)
  VALUES ('J500', 'SAMMIE', 'JONES', NULL, NULL, 2000, 'NW');
  
/* View DEFAULT option information from the data dictionary */
SELECT table_name, column_name, data_default, default_on_null
  FROM user_tab_columns
  WHERE table_name = 'ACCTMANAGER';
  
/* Add a virtual column */
ALTER TABLE acctmanager
  ADD (amearn AS (amsal + amcomm));
  
/* Prompt for subtitution variable input */
UPDATE customers
  SET region = '&Region'
  WHERE state = '&State';
  
SELECT customer#, state, region
  FROM customers;
  
/*INSERT INTO customers
  VALUES SET customer# = "&Customer#', region = '&Region', state = '&State';*/
  
COMMIT;

-- Create a eaved point named ONE
SAVEPOINT ONE;

UPDATE acctmanager
  SET region = 'E';
  
-- Rollback to saved point ONE
ROLLBACK TO ONE;
  
  
  
  
  