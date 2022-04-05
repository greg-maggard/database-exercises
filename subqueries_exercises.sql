USE employees;

-- Find all the current employees with the same hire date as employee 101010 using a sub-query.

SELECT first_name, last_name
FROM employees
WHERE hire_date = (SELECT hire_date FROM employees WHERE emp_no = '101010');
-- This query returns 69 rows. 

-- Find all the titles ever held by all current employees with the first name Aamod.
SELECT DISTINCT title
FROM titles
WHERE emp_no IN (SELECT emp_no FROM employees WHERE first_name = 'Aamod') AND to_date LIKE '9999%';

-- How many people in the employees table are no longer working for the company? Give the answer in a comment in your code.
SELECT COUNT(*)
FROM employees
WHERE emp_no NOT IN (SELECT DISTINCT emp_no FROM dept_emp WHERE to_date > curdate());

-- There are 59900 people that are no longer with the company. 

-- Find all the current department managers that are female. List their names in a comment in your code.
SELECT CONCAT(first_name, ' ', last_name) as 'Name'
FROM employees
WHERE emp_no IN (SELECT emp_no FROM dept_manager WHERE gender = 'F' AND to_date > curdate());
-- Isamu Legleitner, Larsten Sigstam, Leon DasSarma, Hilary Kambil

-- Find all the employees who currently have a higher salary than the companies overall, historical average salary.
SELECT CONCAT(first_name, ' ', last_name) as 'Name'
FROM employees 
JOIN salaries
	ON employees.emp_no = salaries.emp_no
WHERE to_date LIKE '9999%' AND salary > (SELECT AVG(salary) FROM salaries);
-- 150,000+ results from this query when run. 

-- How many current salaries are within 1 standard deviation of the current highest salary? (Hint: you can use a built in function to calculate the standard deviation.) What percentage of all salaries is this?

SELECT MAX(salary) - STDDEV(salary) FROM salaries
WHERE to_date > NOW();

SELECT COUNT(*), COUNT(*) / (SELECT COUNT(*) FROM salaries WHERE to_date > NOW()) * 100
FROM salaries
WHERE to_date > NOW() AND salary > (SELECT MAX(salary) - STDDEV(salary) FROM salaries
WHERE to_date > NOW());
-- There are are 83 people with salaries within 1 SD of the current highest salary.



