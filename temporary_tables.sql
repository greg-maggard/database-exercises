USE jemison_1757;

-- Using the example from the lesson, create a temporary table called employees_with_departments that contains first_name, last_name, and dept_name for employees currently with that department.
CREATE TEMPORARY TABLE employees_with_departments AS 
SELECT first_name, last_name, departments.dept_name
FROM employees.employees
JOIN employees.dept_emp USING(emp_no)
JOIN employees.departments USING (dept_no);

-- Add a column named full_name to this table. It should be a VARCHAR whose length is the sum of the lengths of the first name and last name columns
SHOW CREATE TABLE employees_with_departments;
-- This tells us that first_name has 14 characters, while last_name has 16 characters, so we'd need a total of 30.

ALTER TABLE employees_with_departments ADD full_name VARCHAR(30);

-- Update the table so that full name column contains the correct data
UPDATE employees_with_departments
SET full_name = CONCAT(first_name, ' ', last_name);

-- Remove the first_name and last_name columns from the table.
ALTER TABLE employees_with_departments DROP COLUMN first_name;
ALTER TABLE employees_with_departments DROP COLUMN last_name;

-- What is another way you could have ended up with this same table?

-- Create a temporary table based on the payment table from the sakila database.
CREATE TEMPORARY TABLE sakila_payments AS
SELECT * FROM sakila.payment;

SELECT * FROM sakila_payments;
SHOW CREATE TABLE sakila_payments;

-- Write the SQL necessary to transform the amount column such that it is stored as an integer representing the number of cents of the payment. For example, 1.99 should become 199.

ALTER TABLE sakila_payments
MODIFY amount DECIMAL (6, 2);

UPDATE sakila_payments SET amount = amount * 100;

ALTER TABLE sakila_payment
MODIFY amount INTEGER;




