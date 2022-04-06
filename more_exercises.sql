##More Drills With The Sakila DatabaseMore Drills With The Sakila Database##
USE sakila; 

# 1. SELECT Statements
-- a. Select all columns from the actor table.
SELECT * 
FROM actor;
-- b. Select only the last_name column from the actor table.
SELECT last_name 
FROM actor;
-- c. Select only the film_id, title, and release_year columns from the film table.
SELECT film_id, title, release_year
FROM film;

# 2. DISTINCT Operator
-- a. Select all distinct (different) last names from the actor table.
SELECT DISTINCT last_name
FROM actor;
-- b. Select all distinct (different) postal codes from the address table.
DESCRIBE address;

SELECT DISTINCT postal_code
FROM address;

-- c. Select all distinct (different) ratings from the film table.
DESCRIBE film;

SELECT DISTINCT rating
FROM film;

#3. WHERE Clause
-- a. Select the title, description, rating, movie length columns from the films table that last 3 hours or longer.
SELECT title, description, rating, length 
FROM film
WHERE length > 180;
	#This returns 39 rows. 
   
-- b. Select the payment id, amount, and payment date columns from the payments table for payments made on or after 05/27/2005.
DESCRIBE payment;

SELECT payment_id, amount, payment_date
FROM payment 
WHERE payment_date > '2005-5-27';
	#This returns 15,730 rows.
  
-- c. Select the primary key, amount, and payment date columns from the payment table for payments made on 05/27/2005.
DESCRIBE payment;
	# payment_id is the primary key

SELECT payment_id, amount, payment_date
FROM payment 
WHERE payment_date > '2005-5-27';
	#This is the same as the above, I just used DESCRIBE to verify the primary key before writing the SELECT statement. 

-- d. Select all columns from the customer table for rows that have a last names beginning with S and a first names ending with N.
DESCRIBE customer;

SELECT * 
FROM customer 
WHERE last_name LIKE 'S%N';
	#This returns 6 rows. 

-- e. Select all columns from the customer table for rows where the customer is inactive or has a last name beginning with "M".
SELECT * 
FROM customer 
WHERE active = 0 OR last_name LIKE 'M%';
	#This returns 72 rows.
    
-- f. Select all columns from the category table for rows where the primary key is greater than 4 and the name field begins with either C, S or T.
DESCRIBE category;

SELECT *
FROM category 
WHERE category_id > 4 
AND name LIKE 'C%' OR name LIKE 'S%' or name LIKE 'T%';
	#This returns 4 rows.
    
-- g. Select all columns minus the password column from the staff table for rows that contain a password.
DESCRIBE staff;

SELECT address_id, picture, email, store_id, active, username, last_update
FROM staff
WHERE password IS NOT NULL;
	#This returns one employee.

-- h. Select all columns minus the password column from the staff table for rows that do not contain a password.
SELECT address_id, picture, email, store_id, active, username, last_update
FROM staff
WHERE password IS NULL;
	#This returns the one other employee. 
    
#4. IN Operator
-- a. Select the phone and district columns from the address table for addresses in California, England, Taipei, or West Java.
DESCRIBE address;
	#The 'district' column is the relevant field. 
SELECT phone, district 
FROM address 
WHERE district IN ('California', 'England', 'Taipei', 'West Java');
	#This returns 42 rows. 
    


