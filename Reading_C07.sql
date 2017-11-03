/* 
Script Name:  Chapter 7 Justlee books store
Developer:    Tu Tong
Date:         October 27, 2017
Purpose:      User creation and management
*/

-- create a common user
CREATE USER c##john
  IDENTIFIED BY pass
  PASSWORD EXPIRE;
  
-- drop user
DROP USER c##john;

SELECT name
  FROM system_privilege_map
  WHERE name LIKE 'INSERT%';
  
-- grant the system privilege CREATE SESSION
GRANT CREATE SESSION
  TO c##john;

-- grant select privilege to user John
GRANT select
  ON anonymous.books
  TO c##john;

-- create a public synonym for table Book
CREATE PUBLIC SYNONYM leebooks
  FOR books;

-- assign the UPDATE privilege on specific columns  
GRANT UPDATE (title, pubdate)
  ON anonymous.books
  TO c##john;
  
-- manage user password
ALTER USER c##john
  IDENTIFIED BY new2pass
  PASSWORD EXPIRE;
  
-- create a role
CREATE ROLE c##order_role;

-- granting privileges to order_role
GRANT SELECT, INSERT, UPDATE
  ON anonymous.customers
  TO c##order_role;
GRANT SELECT, INSERT, UPDATE
  ON anonymous.orders
  TO c##order_role;
GRANT SELECT, INSERT, UPDATE
  ON anonymous.orderitems
  TO c##order_role;
  
-- granting the order_role to user John
GRANT c##order_role 
  TO c##john;
  
-- create a role
CREATE ROLE c##billing_role;

-- granting privileges to order_role
GRANT SELECT, INSERT, UPDATE
  ON anonymous.customers
  TO c##billing_role;
GRANT SELECT, INSERT, UPDATE
  ON anonymous.orders
  TO c##billing_role;
GRANT SELECT, INSERT, UPDATE
  ON anonymous.orderitems
  TO c##billing_role;
  
-- granting the order_role to user John
GRANT c##order_role, c##billing_role 
  TO c##john;
  
-- create a role that includes 2 roles
CREATE ROLE c##supervisior;

GRANT c##order_role, c##billing_role
  TO c##supervisior;

-- verifying active system privileges and roles
SELECT *
  FROM user_sys_privs;
  
SELECT *
  FROM user_role_privs;
  
-- verifying privileges assigned to a role
SELECT *
  FROM role_tab_privs
  WHERE role = 'C##BILLING_ROLE'
  ORDER BY table_name;
  
