/* 
Script Name:  Chapter 10 Justlee books store
Developer:    Tu Tong
Date:         November 3, 2017
Purpose:      Selected single-row functions
*/

SELECT * FROM customers;

-- LOWER funciton in the SELECT and WHERE clauses
SELECT LOWER(firstname), LOWER(lastname)
  FROM customers
  WHERE LOWER(lastname) = 'nelson';
  
-- Using the UPPER function manage user input
SELECT firstname, lastname
  FROM customers
  WHERE lastname = UPPER('&Custval');
  
-- SUBSTR funtion extracting part of the zip code
SELECT DISTINCT SUBSTR(zip, 1, 3), zip
  FROM customers;
  
-- Comparison of SUBSTR arguments
SELECT DISTINCT zip, SUBSTR(zip, 1, 3), SUBSTR(zip, -3, 2)
  FROM customers
  WHERE SUBSTR(zip, -3, 2) < 30;
  
-- Comparison of INSTR arguments
SELECT name, INSTR(name, ',') "First comma",
             INSTR(name, ',', 10) "Start read position 10",
             INSTR(name, ',', 1, 2) "Second comma"
  FROM contacts;
  
-- Using nested functions in a query
SELECT name, 
       SUBSTR(name, 1, INSTR(name, ',') - 1) AS Last,
       SUBSTR(name, 
              INSTR(name, ',') + 1,
              INSTR(name, ',', 1, 2) - INSTR(name, ',') - 1) 
              AS First
  FROM contacts;
  
-- Using the LTRIM function
SELECT lastname, address, LTRIM(address, 'P.O. BOX')
  FROM customers
  WHERE state = 'FL';
  
-- Using the REPLACE funciton
SELECT address, REPLACE(address, 'P.O.', 'POST OFFICE')
  FROM customers
  WHERE state = 'FL';
  
-- using TRANSLATE to subtitute character value
SELECT name, TRANSLATE(name, ',',  '-'), TRANSLATE(name, ',A', '-a')
  FROM contacts;
  
-- Using CONCAT function
SELECT firstname, lastname,
       CONCAT('Customer number: ', customer#) "Number"
  FROM customers
  WHERE state = 'FL';
  
-- Using ROUND function
SELECT title, retail, ROUND(retail, 1), ROUND(retail, 0), ROUND(retail, -1)
  FROM books;
  
SELECT ROUND(21.12, 1)
  FROM DUAL;

-- Using the TRUNC funciton to truncate numbers at various places
SELECT title, retail, TRUNC(retail, 1), TRUNC(retail, 0), TRUNC(retail, -1)
  FROM books;
  
-- Using MOD function to return the remainder
SELECT 235/16
  FROM DUAL;

SELECT TRUNC(235/16, 0) LBS, MOD(245, 16) OZ
  FROM DUAL;
  
-- The effect of using ABS function
SELECT (300 - 500), ABS(300 - 500)
  FROM DUAL;

-- Using POWER function
SELECT (2 * 2 * 2), POWER(2, 3)
  FROM DUAL;
  
/* DATE FUNCTIONS */
-- a calculation with date columns
SELECT order#, shipdate, orderdate, (shipdate-orderdate) AS Delay
  FROM orders
  WHERE order# = 1004;
  
-- Using the MONTHS_BETWEEN
SELECT title, orderdate, pubdate, ROUND(MONTHS_BETWEEN(orderdate, pubdate), 0) AS MONTHS
  FROM books JOIN orderitems USING (isbn)
       JOIN orders USING (order#)
   WHERE order# = 1004;
 
-- Using the ADD_MONTHS function
SELECT title, pubdate, ADD_MONTHS('01-DEC-08', 18) "Renegotiate Date",
        ADD_MONTHS(pubdate, 84) "Drop Date"
  FROM books
  WHERE category = 'COMPUTER'
  ORDER BY "Renegotiate Date";
  
-- Uusing the NEXT_DAY function (find next monday)
SELECT order#, orderdate, NEXT_DAY(orderdate, 'MONDAY')
  FROM orders
  WHERE order# = 1018;
  
-- USing the LAST_DAY function (last day of current month)
SELECT order#, orderdate, LAST_DAY(orderdate)
  FROM orders
  WHERE order# IN(1002, 1003);

-- Using the TO_DATE function
SELECT order#, orderdate, shipdate
  FROM orders
  WHERE orderdate = TO_DATE('March 31, 2009', 'Month DD, YYYY');
  
-- server time vs. system time
SELECT TO_CHAR(CURRENT_DATE, 'DD-MON-YY HH:MM:SS'),
       TO_CHAR(SYSDATE, 'DD-MON-YY HH:MM:SS')
  FROM DUAL;

-- identify time zone information
SELECT current_timestamp, systimestamp
  FROM DUAL;
  
-- Using Regular expression to identify complete phone numbers
/* 
[0-9]{3}  The [0-9] operator indicates that it's looking for a single character
          that must be a digit. {3} indicates repeating the previous operator
          three times. In this case, these two operators together search for
          a three-digit number.
[-.]      This operator indicates that the next character must be a hyphen (-)
          or a period.
[0-9]{3}  The next three places in the string must contain three digits.
[-.]      The next place in the string can be a hyphen (-) or period.
[0-9]{4}  The last four places in the string must contain for digits.
*/
SELECT *
  FROM suppliers
  WHERE REGEXP_LIKE(description, '[0-9]{3}[-.][0-9]{3}[-.][0-9]{4}');
  
SELECT sup_name, REGEXP_SUBSTR(description, '[0-9]{3}[-.][0-9]{3}[-.][0-9]{4}')
  FROM suppliers;
  
SELECT *
  FROM suppliers
  WHERE REGEXP_LIKE(description, '^Used');


-- Handle NULL calculation with the NVL funciton
SELECT title, retail, discount, (retail - NVL(discount, 0)) AS "Sales price"
  FROM books;
  
-- Using DECODE to determine sales tax rate by state
SELECT customer#, state,
       DECODE(state, 'CA', 0.08,
                     'FL', 0.07,
                              0) "Sales Tax Rate"
  FROM customers;

