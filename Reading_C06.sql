
-- Verify sequece options settings
SELECT *
  FROM user_sequences;
  
-- view all objects
SELECT *
  FROM user_objects;

-- view orders table
SELECT * 
  FROM orders;
  
-- Generate a sequence for order number
CREATE SEQUENCE orders_order#_seq
  INCREMENT BY 1
  START WITH 1021
  NOCACHE
  NOCYCLE;

-- verify orders from customer 1010
SELECT order#, customer#, orderdate, shipdate, shipstreet,
       shipcity, shipstate, shipzip
  FROM orders
  WHERE customer# = 1010
  ORDER BY order#;

-- Inserting a row using a sequence to provide a PRIMARY KEY value
INSERT INTO orders (order#, customer#, orderdate, shipdate, shipstreet,
                    shipcity, shipstate, shipzip)
  VALUES (orders_order#_seq.NEXTVAL, 1010, '06-APR-09', NULL, '123 WEST MAIN',
          'ATLANTA', 'GA', 30418);
          
-- Using CURRVAL to insert an order detail row
INSERT INTO orderitems (order#, item#, isbn, quantity, paideach)
  VALUES (orders_order#_seq.CURRVAL, 1, 8117949391, 1, 8.50);
  
-- verify order detail
SELECT *
  FROM orderitems
  WHERE order# = 1021;
  
-- Create sequence and table with default value using a sequence
CREATE SEQUENCE test_defval_seq
  INCREMENT BY 1
  START WITH 100
  NOCACHE
  NOCYCLE;
  
CREATE TABLE test_defval
  (col1 NUMBER DEFAULT test_defval_seq.NEXTVAL,
  col2 NUMBER);
  
INSERT INTO test_defval (col1, col2)
  VALUES (DEFAULT, 350);
INSERT INTO test_defval (col2)
  VALUES (355);
INSERT INTO test_defval (col1, col2)
  VALUES (103, 360);
  
SELECT * FROM test_defval;

/************************************/
/* B-Tree Indexes */
/************************************/

SELECT * FROM user_indexes;

SELECT * FROM customers;

-- Create index
CREATE INDEX customers_zip_idx
  ON customers (zip);

-- Explain plan
SELECT customer#, lastname, city, state, zip
  FROM customers
  WHERE zip = 49006;
  
SELECT /*+INDEX(customers)*/ customer#, lastname, city, state, zip
  FROM customers
  WHERE zip = 49006;
  
-- explicitly creating a unique index
CREATE UNIQUE INDEX books_title_idx
  ON books (title);
  
-- create an index that improve performance on large sorting operation
-- this creates a Funtion-Based index
CREATE INDEX customers_zip_desc_idx
  ON customers(zip DESC);


