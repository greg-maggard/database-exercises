USE employees;
DESCRIBE employees;

-- In your script, use DISTINCT to find the unique titles in the titles table. How many unique titles have there ever been? Answer that in a comment in your SQL file
SELECT COUNT(DISTINCT title)
FROM titles;
-- There have been 7 distinct titles. 

-- Write a query to to find a list of all unique last names of all employees that start and end with 'E' using GROUP BY.
SELECT last_name
from employees
WHERE last_name LIKE 'E%E'
GROUP BY last_name;
-- Erde, Eldridge, Etalle, Erie, Erbe

-- Write a query to to find all unique combinations of first and last names of all employees whose last names start and end with 'E'.
SELECT first_name, last_name
FROM employees
GROUP BY first_name, last_name
HAVING last_name LIKE 'E%e';
-- 846 unique combinations are returned when this is run. 

-- Write a query to find the unique last names with a 'q' but not 'qu'. Include those names in a comment in your sql code.
SELECT last_name
FROM employees
GROUP BY last_name
HAVING last_name LIKE '%q%' AND last_name NOT LIKE '%qu%';
-- Chleq, Lindqvist, and Qiwen

-- Add a COUNT() to your results (the query above) to find the number of employees with the same last name.
Select last_name, COUNT(last_name) 
FROM employees
GROUP BY last_name
HAVING last_name LIKE '%q%' AND last_name NOT LIKE '%qu%';
-- Chleq: 189, Lindqvist: 190, Qiwen: 168.

-- Find all all employees with first names 'Irena', 'Vidya', or 'Maya'. Use COUNT(*) and GROUP BY to find the number of employees for each gender with those names.
SELECT first_name, COUNT(*), gender
FROM employees 
GROUP BY first_name, gender
HAVING first_name IN ('Irena', 'Vidya', 'Maya')
ORDER BY first_name;

-- Using your query that generates a username for all of the employees, generate a count employees for each unique username. Are there any duplicate usernames? BONUS: How many duplicate usernames are there?
SELECT LOWER(CONCAT(SUBSTR(first_name, 1, 1), SUBSTR(last_name, 1, 4), '_', SUBSTR(birth_date, 6, 2), SUBSTR(birth_date, 3, 2))) AS username, COUNT(*) as duplicate_count
FROM employees
GROUP BY username
-- HAVING duplicate_count > 1 #windows function quick-look
ORDER BY COUNT(*) DESC;
-- The different usernames are below when query is run. Removing the comment in the 4th line will show that there are 13251 usernames that are duplicated. I want to look into window functions a bit later to display this more elegantly. 

