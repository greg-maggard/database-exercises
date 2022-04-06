USE employees;

-- Write a query that returns all employees, their department number, their start date, their end date, and a new column 'is_current_employee' that is a 1 if the employee is still with the company and 0 if not.

SELECT emp_no, dept_no, from_date, to_date,
	CASE
		WHEN to_date LIKE '9999%' THEN 1 
        ELSE 0
	END AS is_current_employee
FROM dept_emp;

-- Write a query that returns all employee names (previous and current), and a new column 'alpha_group' that returns 'A-H', 'I-Q', or 'R-Z' depending on the first letter of their last name.
SELECT CONCAT(first_name, ' ', last_name),
	CASE 
		WHEN SUBSTRING(last_name,1,1) <= 'H' THEN 'A-H'
        WHEN SUBSTRING(last_name,1,1) > 'H' AND SUBSTRING(last_name,1,1) <= 'Q' THEN 'I-Q'
        WHEN SUBSTRING(last_name,1,1) > 'Q' AND SUBSTRING(last_name,1,1) <= 'Z' THEN 'R-Z'
        ELSE NULL
	END AS alpha_group
FROM employees;

-- How many employees (current or previous) were born in each decade?
USE jemison_1757; 

CREATE TEMPORARY TABLE employee_birth_dates AS
SELECT birth_date 
FROM employees.employees;
SELECT MAX(birth_date) FROM employee_birth_dates; 

SELECT * FROM employee_birth_dates;

CREATE TEMPORARY TABLE employee_birth_decade AS
SELECT
	CASE
		WHEN birth_date LIKE '195%' THEN 'Fifties'
        WHEN birth_date LIKE '196%' THEN 'Sixties'
		ELSE NULL
    END AS birth_decade
FROM employee_birth_dates;

SELECT * FROM employee_birth_decade;

SELECT COUNT(birth_decade LIKE 'Fifties') as 'Fifties', COUNT(birth_decade LIKE 'Sixties') as 'Sixties', COUNT(NULL) as 'NULL'
FROM employee_birth_decade; ##Follow up to ask why this doesn't work.

SELECT COUNT(CASE WHEN birth_decade LIKE 'Fifties' THEN 50 ELSE NULL END) as 'Fifties', COUNT(CASE WHEN birth_decade LIKE 'Sixties' THEN 60 ELSE NULL END) AS 'Sixties', COUNT(NULL) as 'NULL'
FROM employee_birth_decade;

## Adam's Solution (THIS IS SO MUCH BETTER):
SELECT
	CONCAT (SUBSTR(birth_date, 1, 3), '0') as decade,
    COUNT(*)
FROM employees
GROUP BY decade;

-- What is the current average salary for each of the following department groups: R&D, Sales & Marketing, Prod & QM, Finance & HR, Customer Service?

SELECT dept_name FROM employees.departments;

SELECT AVG(salary) as 'average_salary',
	CASE 
		WHEN dept_name IN ('Research', 'Development') THEN 'R&D'
        WHEN dept_name IN ('Sales', 'Marketing') THEN 'Sales & Marketing'
        WHEN dept_name IN ('Production', 'Quality Management') THEN 'Prod & QM'
        WHEN dept_name IN ('Finance', 'Human Resources') THEN 'Finance & HR'
        WHEN dept_name IN ('Customer Service') THEN 'Customer Service'
        ELSE NULL
	END AS department_group
FROM employees.departments
JOIN employees.dept_emp USING(dept_no)
JOIN employees.salaries USING(emp_no)
WHERE dept_emp.to_date > CURDATE() AND salaries.to_date > CURDATE()
GROUP BY department_group;



