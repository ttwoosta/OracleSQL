/* 
Script Name:  Chapter 9 Justlee books store
Developer:    Tu Tong
Date:         November 3, 2017
Purpose:      Joining Data from Multiple Tables
*/

SELECT *
  FROM user_tables
  ORDER BY table_name;

SELECT *
  FROM warehouses;
  
-- Producing an intended Cartesian join
SELECT isbn, title, location, ' ' Count
  FROM books, warehouses
  ORDER BY location, title;
  
-- Using CROSS JOIN keyword
SELECT isbn, title, location, ' ' Count
  FROM books CROSS JOIN warehouses
  ORDER BY location, title;
  
-- An equality join (Traditional method)
SELECT title, name
  FROM books, publisher
  WHERE books.pubid = publisher.pubid;
  
-- Equality join with table aliass
SELECT b.title, b.pubid, p.name
  FROM books b, publisher p
  WHERE b.pubid = p.pubid;
  
-- Muliple joins combined with a search condition
SELECT c.lastname, c.firstname, b.title
  FROM customers c, orders o, orderitems oi, books b
  WHERE c.customer# = o.customer#
    AND o.order# = oi.order#
    AND oi.isbn = b.isbn
  ORDER BY lastname, firstname;
  
-- Using Natural Join keyword
SELECT title, pubid, name
  FROM publisher NATURAL JOIN books;
  
-- Performing a join with the JOIN...USING keywords
SELECT b.title, pubid, p.name
  FROM publisher p JOIN books b
  USING (pubid);
  
SELECT *
  FROM publisher2;
  
-- Performing a join with the JOIN...ON keywords
SELECT b.title, b.pubid, p.name
  FROM publisher2 p JOIN books b
       ON p.id = b.pubid;
       
-- Multiple joins combined with search condition
SELECT c.lastname, c.firstname, o.orderdate, b.title, oi.quantity
  FROM customers c JOIN orders o USING (customer#)
       JOIN orderitems oi USING (order#)
       JOIN books b USING (isbn)
  WHERE category = 'COMPUTER'
  ORDER BY lastname, orderdate;
  
-- A traditional non-equality join
SELECT b.title, p.gift, b.retail, p.minretail, p.maxretail
  FROM books b, promotion p
  WHERE b.retail BETWEEN p.minretail AND p.maxretail;
  
-- A self-join with the traditional method
SELECT r.firstname, r.lastname, c.lastname "Referred"
  FROM customers c, customers r
  WHERE c.referred = r.customer#;
  
-- List customers with a tradiional outer join with the (+) operator
SELECT c.lastname, c.firstname, o.order#
  FROM customers c, orders o
  WHERE c.customer# = o.customer#(+)
  ORDER BY c.lastname, c.firstname;
  
-- List customers with a tradiional outer join with the (+) operator
SELECT c.lastname, c.firstname, o.order#, r.lastname referral
  FROM customers c, orders o, customers r
  WHERE c.customer# = o.customer#(+)
    AND c.referred = r.customer#(+)
  ORDER BY c.lastname, c.firstname;

-- Assigning multiple outer joins on a single table  
SELECT c.lastname, c.firstname, o.order#, e.lname
  FROM customers c, orders o, employees e
  WHERE c.customer#(+) = o.customer#
    AND c.region(+) = e.region
   ORDER BY o.order#, c.lastname, c.firstname;
   
-- Using a left outer join
SELECT c.lastname, c.firstname, o.order#
  FROM customers c LEFT OUTER JOIN orders o
       USING (customer#)
  ORDER BY c.lastname, c.firstname;
  
-- Using a right outer join
SELECT c.lastname, c.firstname, o.order#
  FROM customers c RIGHT OUTER JOIN orders o
       USING (customer#)
  ORDER BY c.lastname, c.firstname;

/***********************************/
/* SET OPERATORS */
/***********************************/
SELECT *
  FROM bookauthor;

SELECT *
  FROM books;

-- producing an unduplicated combined list with
-- the UNION set operator (single column only)
SELECT ba.authorid
  FROM books b JOIN bookauthor ba
        USING (isbn)
  WHERE category = 'FAMILY LIFE'
UNION
SELECT ba.authorid
  FROM books b JOIN bookauthor ba
        USING (isbn)
  WHERE category = 'CHILDREN';

-- producing a combined list with duplication
-- by using the UNION ALL set operator (single column only)
SELECT ba.authorid
  FROM books b JOIN bookauthor ba
        USING (isbn)
  WHERE category = 'FAMILY LIFE'
UNION ALL
SELECT ba.authorid
  FROM books b JOIN bookauthor ba
        USING (isbn)
  WHERE category = 'CHILDREN';

-- Conbine results for mulitple columns comparision
-- which are compared positionally
SELECT pubid, name
  FROM publisher
UNION
SELECT id, name
  FROM publisher3
ORDER BY pubid;

-- identiy overlapping values with the INTERSECT set operator
SELECT customer#
  FROM customers
INTERSECT
SELECT customer#
  FROM orders;
  
-- Subtract result sets with the MINUS set operator
SELECT customer#
  FROM customers
MINUS
SELECT customer#
  FROM orders;