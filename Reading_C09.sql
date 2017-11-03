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