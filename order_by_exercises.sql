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

-- ************************************************************ THE ORDER_BY EXERCISES ARE BELOW THIS LINE ************************************************************

-- Find all employees with first names 'Irena', 'Vidya', or 'Maya', and order your results returned by first name. In your comments, answer: What was the first and last name in the first row of the results? What was the first and last name of the last person in the table?
SELECT DISTINCT emp_no, first_name, last_name
FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya')
ORDER BY first_name;
-- First person is Irena Reutenauer. Last person is Vidya Simmen. 

-- Find all employees with first names 'Irena', 'Vidya', or 'Maya', and order your results returned by first name and then last name. In your comments, answer: What was the first and last name in the first row of the results? What was the first and last name of the last person in the table?
SELECT DISTINCT emp_no, first_name, last_name
FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya')
ORDER BY first_name, last_name;
-- First person is Irena Acton. Last person is Vidya Zweizig

-- Find all employees with first names 'Irena', 'Vidya', or 'Maya', and order your results returned by last name and then first name. n your comments, answer: What was the first and last name in the first row of the results? What was the first and last name of the last person in the table?
SELECT DISTINCT emp_no, first_name, last_name
FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya')
ORDER BY last_name, first_name;
-- First person is Irena Acton. Last person is Maya Zyda.

-- Write a query to to find all employees whose last name starts and ends with 'E'. Sort the results by their employee number. Enter a comment with the number of employees returned, the first employee number and their first and last name, and the last employee number with their first and last name.
SELECT DISTINCT emp_no, first_name, last_name
FROM employees
WHERE last_name LIKE ('E%E')
ORDER BY emp_no;
-- 899 employees returned. First is 10021 Ramzi Erde. Last is 499648 Tadahiro Erde.

-- Write a query to to find all employees whose last name starts and ends with 'E'. Sort the results by their hire date, so that the newest employees are listed first. Enter a comment with the number of employees returned, the name of the newest employee, and the name of the oldest employee.
SELECT DISTINCT emp_no, first_name, last_name, hire_date
FROM employees
WHERE last_name LIKE ('E%E')
ORDER BY hire_date DESC;
-- 899 employees returned. Newest is Teiji Eldridge. Oldest is Sergi Erde. 

-- Find all employees hired in the 90s and born on Christmas. Sort the results so that the oldest employee who was hired last is the first result. Enter a comment with the number of employees returned, the name of the oldest employee who was hired last, and the name of the youngest employee who was hired first.
SELECT DISTINCT emp_no, first_name, last_name, hire_date, birth_date
FROM employees
WHERE hire_date BETWEEN '1990-01-01' AND '1999-12-31'
AND birth_date LIKE '%-12-25'
ORDER BY birth_date ASC, hire_date DESC;
-- 362 employees returned. Oldest employee hired last is Khun Bernini. Youngest employee hired first is Douadi Pettis. 

