
-- verifying session privileges
SELECT *
  FROM SESSION_PRIVS;
  
UPDATE leebooks
  SET pubdate = '21-FEB-07',
      pubid = 5
  WHERE isbn = 1059831198;

-- Enable role after login
SET ROLE c##billing_role;

SELECT *
  FROM anonymous.customers;