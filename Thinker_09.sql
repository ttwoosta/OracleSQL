
/* List all order shipped within 3 days 
after the order was received */
SELECT *
  FROM orders 
  WHERE shipdate - orderdate <= 3;
  
/* List all orders placed by customer# 1020 
that have not yet been shipped */
SELECT *
  FROM orders
  WHERE customer# = 1020 
    AND shipdate IS NULL;
    
-- List all orders that have not yet been shipped
SELECT *
  FROM orders
  WHERE shipdate is NULL;
  
-- list all books with a retail price of more than $38 sorted by retail price
SELECT *
  FROM books
  WHERE retail > 38 
  ORDER BY retail;
  
-- list all books that generate more than 60% profit
SELECT *
  FROM books
  WHERE (retail - cost) / cost > .60;
  
-- list all books published in 2003
SELECT *
  FROM books
  WHERE pubdate BETWEEN '01-JAN-03' AND '31-DEC-03';
SELECT *
  FROM books
  WHERE pubdate LIKE '%03';