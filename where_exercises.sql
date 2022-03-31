use employees;

DESCRIBE employees;

-- Find all current or previous employees with first names 'Irena', 'Vidya', or 'Maya' using IN. Enter a comment with the number of records returned.
SELECT COUNT(DISTINCT emp_no, first_name, last_name)
FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya');
-- 709 Records returned. 

-- Find all current or previous employees with first names 'Irena', 'Vidya', or 'Maya', as in Q2, but use OR instead of IN. Enter a comment with the number of records returned. Does it match number of rows from Q2?
SELECT COUNT(DISTINCT emp_no, first_name, last_name)
FROM employees
WHERE first_name = 'Irena' OR first_name = 'Vidya' OR first_name = 'Maya';
-- 709 rows were returned here, too. 

-- Find all current or previous employees with first names 'Irena', 'Vidya', or 'Maya', using OR, and who is male. Enter a comment with the number of records returned.
SELECT COUNT(DISTINCT emp_no, first_name, last_name)
FROM employees
WHERE (first_name = 'Irena' OR first_name = 'Vidya' OR first_name = 'Maya')
AND gender = 'M';
-- 441 Records returned.

-- Find all current or previous employees whose last name starts with 'E'. Enter a comment with the number of employees whose last name starts with E.
SELECT COUNT(DISTINCT emp_no, first_name, last_name)
FROM employees 
WHERE last_name LIKE 'E%';
-- 7330 Records returned.

-- Find all current or previous employees whose last name starts or ends with 'E'. Enter a comment with the number of employees whose last name starts or ends with E. How many employees have a last name that ends with E, but does not start with E?
SELECT COUNT(DISTINCT emp_no, first_name, last_name)
FROM employees 
WHERE last_name LIKE 'E%' OR last_name LIKE '%E';
-- 30723 records returned. 

-- How many employees have a last name that ends with E, but does not start with E?
SELECT COUNT(DISTINCT emp_no, first_name, last_name)
FROM employees 
WHERE last_name NOT LIKE 'E%' AND last_name LIKE '%E';
-- 23393 Records returned.

-- Find all current or previous employees employees whose last name starts and ends with 'E'. Enter a comment with the number of employees whose last name starts and ends with E.
SELECT COUNT(DISTINCT emp_no, first_name, last_name)
FROM employees 
WHERE last_name LIKE 'E%E';
-- 899 records returned.

-- How many employees' last names end with E, regardless of whether they start with E?
SELECT COUNT(DISTINCT emp_no, first_name, last_name)
FROM employees 
WHERE last_name LIKE '%E';
-- 24292 records returned.

-- Find all current or previous employees hired in the 90s. Enter a comment with the number of employees returned.
SELECT COUNT(DISTINCT emp_no, first_name, last_name)
FROM employees
WHERE hire_date LIKE '199%';
-- Returned 135214 employees (originally did not include COUNT, and could only see 50000 records)

-- Find all current or previous employees born on Christmas. Enter a comment with the number of employees returned.
SELECT COUNT(DISTINCT emp_no, first_name, last_name)
FROM employees
WHERE birth_date LIKE '%-12-25';
-- 842 employees.

-- Find all current or previous employees hired in the 90s and born on Christmas. Enter a comment with the number of employees returned.
SELECT COUNT(DISTINCT emp_no, first_name, last_name)
FROM employees
WHERE hire_date BETWEEN '1990-01-01' AND '1999-12-31'
AND birth_date LIKE '%-12-25';
-- Returned 362 employees.

-- Find all current or previous employees with a 'q' in their last name. Enter a comment with the number of records returned.
SELECT COUNT(DISTINCT emp_no, first_name, last_name)
FROM employees
WHERE last_name LIKE '%q%';
-- Returned 1873 employees. 

-- Find all current or previous employees with a 'q' in their last name but not 'qu'. How many employees are found?
SELECT COUNT(DISTINCT emp_no, first_name, last_name)
FROM employees
WHERE last_name LIKE '%q%'
AND 
last_name NOT LIKE '%qu%';
-- Returned 547 employees.
