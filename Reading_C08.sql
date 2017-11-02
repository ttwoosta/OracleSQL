/* 
Script Name:  Chapter 8 Justlee books store
Developer:    Tu Tong
Date:         October 27, 2017
Purpose:      Restricing rows and sorting data
*/

-- Query perform search for FL state
SELECT lastname, state
  FROM customers
  WHERE state = 'FL';
  
-- search for customer 1010
SELECT *
  FROM customers
  WHERE customer# = 1010;
  
-- search for book math ISBN
SELECT *
  FROM books
  WHERE isbn = 1915762492;
  
-- query with a date condition
SELECT *
  FROM books
  WHERE pubdate = '21-JAN-05'; -- Default date format

-- Search for books with a retail price grater than $55
SELECT *
  FROM books
  WHERE retail > 55;
  
SELECT *
  FROM books
  WHERE title > 'HO';
  
-- Search profit with the "less than" operator
SELECT title, (retail - cost) profit
  FROM books
  WHERE (retail - cost) < (cost * 0.2);
  
-- Search State with the "less than or equal to" operator
SELECT firstname, lastname, state
  FROM customers
  WHERE state <= 'GA';

SELECT *
  FROM customers
  WHERE state != 'GA'; -- != or <> or ^=
  
-- Search for orders in the past
SELECT *
  FROM orders
  WHERE orderdate < '01-APR-09';
  
SELECT *
  FROM orders
  WHERE orderdate < SYSDATE;
  
-- Search for Pubid with the BETWEEN ... AND operator
SELECT title, pubid
  FROM books
  WHERE pubid BETWEEN 1 AND 3;
  
-- Searching for State with the IN operator
SELECT firstname, lastname, state
  FROM customers
  WHERE state IN ('CA', 'TX');
  
-- wildcard search
SELECT isbn, title
  FROM books
  WHERE isbn LIKE '_4%0';
  
-- Using the ESCAPE option with the LIKE operator
SELECT *
  FROM testing
  WHERE tvalue LIKE '\%__A%T' ESCAPE '\';

/* In regards to sorting, if a DISTINCT option is used
in the SELECT clause of a query then only columns in
the SELECT clause can be used for sorting */
SELECT DISTINCT shipdate
  FROM orders
  WHERE shipdate IS NOT NULL
  ORDER BY order# DESC;
  
/* the query will return all books that cost at least $25.00 */
SELECT *
  FROM books
  WHERE cost >= 25.00;

/* query will retreive all books stored in the
BOOKS table with Pubid 1 or 2 that have a retail price
of at least $42.00 */
SELECT *
  FROM books
  WHERE pubid IN(1,2) OR retail >= 42;
  
/* Select books and sort them in order of their category
for the book in same category, sort the title of
the book in descending order */
SELECT category, title 
  FROM books
  ORDER BY 1 ASC, 2 DESC;
  
/* search for order 1007 and display
how long it took to ship.
*/
SELECT order#, (shipdate - orderdate)
  FROM orders WHERE order# = 1007;
  
/* list order placed by customer # 1020
that have not yet been shipped */
SELECT * 
  FROM orders
  WHERE customer# = 1020 AND shipdate IS NULL;
  
/* list orders that were not shipped for at least three days
after the order was received */
SELECT * 
  FROM orders
  WHERE (shipdate - orderdate) >= 3;
  
/* list orders placed in the month of March */
SELECT * 
  FROM orders 
  WHERE orderdate BETWEEN '01-Mar-09' AND '31-Mar-09';
  
/* query will list all orders contained in the ORDERS table
that have been shipped based upon the customer# and order# */
SELECT *
  FROM orders
  WHERE shipdate IS NOT NULL
  ORDER BY customer#, order#;





  
