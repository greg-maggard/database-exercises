use join_example_db;


-- Use the join_example_db. Select all the records from both the users and roles tables.
SELECT * FROM users;
SELECT * FROM roles;

-- Use join, left join, and right join to combine results from the users and roles tables as we did in the lesson. Before you run each query, guess the expected number of results.
SELECT * FROM users
JOIN roles ON users.role_id = roles.id;
## This returns the highest level of data loss, but the cleanest table.

SELECT * FROM users
LEFT JOIN roles ON users.role_id = roles.id;

SELECT * FROM users
RIGHT JOIN roles on users.role_id = roles.id;

-- Although not explicitly covered in the lesson, aggregate functions like count can be used with join queries. Use count and the appropriate join type to get a list of roles along with the number of users that has the role. Hint: You will also need to use group by in the query.
SELECT 
	roles.name AS role_name,
COUNT(users.name) AS number_of_employees
FROM users
RIGHT JOIN roles ON user.role_id = roles.id
GROUP BY role_name;

## COME BACK AND SEE HOW THIS WORKS ^^^^^^^


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
	ON departments.dept_no = manager.dept_no
WHERE manager.to_date LIKE '9999%'
ORDER BY department;
    
-- Find the name of all departments currently managed by women.
SELECT CONCAT(first_name, ' ', last_name) as name, departments.dept_name as department
FROM employees 
JOIN dept_manager as manager
	on employees.emp_no = manager.emp_no
JOIN departments
	ON departments.dept_no = manager.dept_no
WHERE employees.gender = 'F' AND manager.to_date > CURDATE();

-- Find the current titles of employees currently working in the Customer Service department.

DESCRIBE titles; -- emp_no
DESCRIBE employees; -- emp_no
DESCRIBE dept_emp; -- emp_no, dept_no, to_date (for *current* employees)

SELECT title.title, COUNT(*)
FROM employees
JOIN titles AS title
	ON title.emp_no = employees.emp_no
JOIN dept_emp
	ON dept_emp.emp_no = title.emp_no -- you can use 'USING' instead of 'ON' for these. Go back and look into this. 
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
SELECT dept_name as 'Department', ROUND(AVG(salary.salary), 2) AS average_salary
FROM departments
JOIN dept_emp
	ON departments.dept_no = dept_emp.dept_no
JOIN salaries AS salary
	ON dept_emp.emp_no = salary.emp_no
WHERE salary.to_date > curdate()
GROUP BY departments.dept_name
ORDER BY average_salary DESC
LIMIT 1; 
-- Sales has the highest average salary at 88842.16. 

-- Who is the highest paid employee in the Marketing department?
SELECT CONCAT(first_name, ' ', last_name) as name, salary.salary AS 'Salary', departments.dept_name as 'Department'
FROM departments 
JOIN dept_emp
	ON departments.dept_no = dept_emp.dept_no
JOIN employees
	ON dept_emp.emp_no = employees.emp_no
JOIN salaries as salary
	ON employees.emp_no = salary.emp_no
WHERE departments.dept_name = 'Marketing' AND dept_emp.to_date > curdate()
ORDER BY salary.salary DESC
LIMIT 1;
-- Akemi Warwick is the highest paid employee in Marketing.

-- Which current department manager has the highest salary?
SELECT CONCAT(first_name, ' ', last_name) as name, salary.salary AS 'Salary', departments.dept_name as 'Department'
FROM departments
JOIN dept_manager as manager
	ON departments.dept_no = manager.dept_no
JOIN employees
	ON manager.emp_no = employees.emp_no
JOIN salaries AS salary
	ON employees.emp_no = salary.emp_no
WHERE salary.to_date > now() ## If you replace this with 'salary.to_date', you get a diff answer. Why? *Talked to instructor, and he advised that I was correct: salary is likely the best table to use.*
ORDER BY salary DESC
LIMIT 1;
-- Highest paid current manager is Margareta Markovitch at $108407.

-- Determine the average salary for each department. Use all salary information and round your results.
# Go back to look at the solution for this one to see how it's done. 

-- When it comes to doing the bonus questions, it's good to remember that when you run a query, you can then run a query on the results of that query. This is the foundation of "sub-queries" and can be really powerful. 






