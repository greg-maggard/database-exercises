USE jemison_1757;

-- Using the example from the lesson, create a temporary table called employees_with_departments that contains first_name, last_name, and dept_name for employees currently with that department.
CREATE TEMPORARY TABLE employees_with_departments AS 
SELECT first_name, last_name, departments.dept_name
FROM employees.employees
JOIN employees.dept_emp USING(emp_no)
JOIN employees.departments USING (dept_no);

-- Add a column named full_name to this table. It should be a VARCHAR whose length is the sum of the lengths of the first name and last name columns
SHOW CREATE TABLE employees_with_departments;
## This tells us that first_name has 14 characters, while last_name has 16 characters, so we'd need a total of 30.

ALTER TABLE employees_with_departments ADD full_name VARCHAR(31);

-- Update the table so that full name column contains the correct data
UPDATE employees_with_departments
SET full_name = CONCAT(first_name, ' ', last_name);

-- Remove the first_name and last_name columns from the table.
ALTER TABLE employees_with_departments DROP COLUMN first_name;
ALTER TABLE employees_with_departments DROP COLUMN last_name;

-- What is another way you could have ended up with this same table?
# If our query can product it, then let's do that: ** THIS IS RYAN'S SOLUTION ** 

CREATE TEMPORARY TABLE employees_with_departments AS
SELECT CONCAT(first_name, ' ', last_name) as full_name, dept_name
FROM employees.employees
JOIN employees.dept_emp USING(emp_no)
JOIN employees.departments using (dept_no)
WHERE to_date > CURDATE();

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

-- Find out how the current average pay in each department compares to the overall, historical average pay. In order to make the comparison easier, you should use the Z-score for salaries. In terms of salary, what is the best department right now to work for? The worst?
USE jemison_1757;

-- Creating table linking emp_no to dept_name
CREATE TEMPORARY TABLE department_employees AS
SELECT e.emp_no, dept_name
FROM employees.employees as e
JOIN employees.dept_emp as de
	USING(emp_no)
JOIN employees.departments as depts
	USING(dept_no);

-- Creating the table that contains my salary comparison information (this is my main table)
CREATE TEMPORARY TABLE salary_comparison AS
SELECT emp_no, salary
FROM employees.salaries
LIMIT 1000;

-- Creating a table that just contains a column of the overall average salary, rather than having this run as a calculation on the main table
CREATE TEMPORARY TABLE avg_salary AS
SELECT avg(salary) as avg_salary
FROM employees.salaries;

select * FROM avg_salary;
-- 1 row(s) affected, 1 warning(s): 1265 Data truncated for column 'avg_salary' at row 1 Records: 1  Duplicates: 0  Warnings: 1


# Creating the column to list the difference in pay from the average
ALTER TABLE jemison_1757.salary_comparison ADD diff INT;

# Creating column to show the average salary overall
ALTER TABLE jemison_1757.salary_comparison ADD avg_salary INT;

SELECT * from jemison_1757.salary_comparison;

UPDATE jemison_1757.salary_comparison SET avg_salary =
(SELECT avg_salary 
FROM jemison_1757.avg_salary);

UPDATE jemison_1757.salary_comparison SET diff = 
(SELECT salary - avg_salary);
    
SELECT * FROM department_employees;

ALTER TABLE salary_comparison DROP COLUMN department;








