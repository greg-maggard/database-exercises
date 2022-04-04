use join_example_db;


-- Use the join_example_db. Select all the records from both the users and roles tables.
SELECT * FROM users;
SELECT * FROM roles;

-- Use join, left join, and right join to combine results from the users and roles tables as we did in the lesson. Before you run each query, guess the expected number of results.
SELECT * FROM users
JOIN roles ON users.role_id = roles.id;

SELECT * FROM users
LEFT JOIN roles ON users.role_id = roles.id;

SELECT * FROM users
RIGHT JOIN roles on users.role_id = roles.id;

-- Use the employees database.
USE employees;



-- Using the example in the Associative Table Joins section as a guide, write a query that shows each department along with the name of the current manager for that department.
DESCRIBE employees;
DESCRIBE dept_manager; -- use emp_no to join with employees
DESCRIBE departments; -- use dept_no to join with dept_manager

SELECT CONCAT(first_name, ' ', last_name) AS name, departments.dept_name AS department
FROM employees
JOIN dept_manager AS manager
	ON employees.emp_no = manager.emp_no
JOIN departments
	ON departments.dept_no = manager.dept_no;
    
-- Find the name of all departments currently managed by women.
SELECT CONCAT(first_name, ' ', last_name) as name, departments.dept_name as department
FROM employees 
JOIN dept_manager as manager
	on employees.emp_no = manager.emp_no
JOIN departments
	ON departments.dept_no = manager.dept_no
WHERE employees.gender = 'F';

-- Find the current titles of employees currently working in the Customer Service department.

DESCRIBE titles; -- emp_no
DESCRIBE employees; -- emp_no
DESCRIBE dept_emp; -- emp_no, dept_no, to_date (for *current* employees)

SELECT title.title, COUNT(*)
FROM employees
JOIN titles AS title
	ON title.emp_no = employees.emp_no
JOIN dept_emp
	ON dept_emp.emp_no = title.emp_no
WHERE title.to_date LIKE '9999%' AND dept_emp.to_date LIKE '9999%' AND dept_no = 'd009'
GROUP BY title.title;

-- Find the current salary of all current managers.

DESCRIBE salaries;

SELECT CONCAT(first_name, ' ', last_name) as name, salaries.salary AS salary
FROM employees
RIGHT JOIN dept_manager as manager
	on employees.emp_no = manager.emp_no
JOIN salaries
	on salaries.emp_no = manager.emp_no
WHERE salaries.to_date LIKE "9999%";

-- Find the number of current employees in each department.
SELECT dept_name as 'Department', COUNT(*) as 'Employee Count'
FROM employees
JOIN dept_emp
	ON employees.emp_no = dept_emp.emp_no
JOIN departments
	ON departments.dept_no = dept_emp.dept_no
WHERE dept_emp.to_date LIKE '9999%'
GROUP BY departments.dept_name;

-- Which department has the highest average salary? Hint: Use current not historic information.




