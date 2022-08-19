# Drills with Sakila DB

USE sakila;

# 1. SELECT Statements:

SELECT * FROM actor;

SELECT last_name FROM actor;

SELECT film_id, title, release_year FROM film;

# 2. DISTINCT Operator:

SELECT DISTINCT last_name FROM actor;

SELECT DISTINCT postal_code FROM address;

SELECT DISTINCT rating FROM film;

# 3. WHERE clause:
SELECT * FROM payment;

SELECT title, description, rating, length FROM film
WHERE length > 3;

SELECT payment_id, amount, payment_date 
FROM payment
WHERE payment_date >= '2005-05-27';
#I need to remember to put these in quotations, and follow the regular format.

SELECT payment_id, amount, payment_date
FROM payment 
WHERE payment_date = '2005-05-27';
#There are no payments on 5/27/2005.

SELECT *
FROM customer
WHERE last_name LIKE 'S%' AND first_name LIKE '%N';

select * from customer;

SELECT * 
FROM customer 
WHERE active = 0 
OR last_name LIKE 'M%';

SELECT * FROM category;

SELECT *
FROM category
WHERE category_id > 4
AND 
name LIKE 'C%' 
OR name LIKE 'S%' 
OR name LIKE 'T%';

SELECT staff_id, first_name, last_name, address_id, picture, email, store_id, active, username, last_update
FROM staff
WHERE password IS NOT NULL;

SELECT staff_id, first_name, last_name, address_id, picture, email, store_id, active, username, last_update
FROM staff
WHERE password IS NULL;
#Another method to solve this would have been to create a temp table of all columns and then drop the password column, but I needed permissions. 

# IN Operator:

SELECT phone, district
FROM address
WHERE district IN ('California', 'England', 'Taipei', 'West Java');

SELECT payment_id, amount, payment_date
FROM payment
WHERE DATE(payment_date) IN ('2005-05-25', '2005-05-27', '2005-05-29');
# When I was originally doing this, I was trying to put the date on the 'IN' list values, but I needed to pull the date from the tables datetime values. 

SELECT *
FROM film
WHERE rating in ('G', 'PG-13', 'NC-17');

#BETWEEN Operator:

SELECT *
FROM payment
WHERE payment_date BETWEEN '2005-05-25' and '2005-05-26'
ORDER BY payment_date;
#Using ORDER BY to ensure I grabbed all the write rows.

SELECT * FROM film;

SELECT film_id, title, description
FROM film 
WHERE LENGTH(description) BETWEEN 100 AND 120;

#LIKE Operator:

SELECT *
FROM film
WHERE description LIKE 'A Thoughtful%'; 

SELECT *
FROM film
WHERE description LIKE '%Boat';

SELECT *
FROM film
WHERE description LIKE ('%Database%')
AND length > 180;

#LIMIT Operator:

SELECT *
FROM payment
LIMIT 20;

SELECT * FROM payment;

SELECT payment_date, amount
FROM payment
WHERE amount > 5
LIMIT 1000
OFFSET 1000
# How do I select indices from the result set? It wants rows where indices in result set are between 1000 and 2000.

##LIMIT C########################################################################################
SELECT *
FROM customer;
#How do I select indices from the result set? It wants rows where indices in result set are between 101-200.alter

#ORDER BY Statement:

SELECT * 
FROM film
ORDER BY length ASC;

SELECT DISTINCT rating
FROM film 
ORDER BY rating DESC;

SELECT payment_date, amount
FROM payment
ORDER BY amount DESC
LIMIT 20;

SELECT * FROM film;

SELECT title, description, special_features, length, rental_duration
FROM film
WHERE special_features LIKE '%Behind the Scenes%'
AND length < 120
AND rental_duration BETWEEN 5 and 7
ORDER BY length DESC;

# JOINs

SELECT customer.first_name AS customer_first_name, customer.last_name AS customer_last_name, actor.first_name AS actor_first_name, actor.last_name AS actor_last_name
FROM customer
LEFT JOIN actor ON customer.last_name = actor.last_name;

SELECT customer.first_name AS customer_first_name, customer.last_name AS customer_last_name, actor.first_name AS actor_first_name, actor.last_name AS actor_last_name
FROM customer
RIGHT JOIN actor on customer.last_name = actor.last_name;

SELECT customer.first_name AS customer_first_name, customer.last_name AS customer_last_name, actor.first_name AS actor_first_name, actor.last_name AS actor_last_name
FROM customer
INNER JOIN actor on customer.last_name = actor.last_name;

SELECT city, country
FROM city
LEFT JOIN country on city.country_id = country.country_id;

SELECT * FROM language;

SELECT title, description, language.name AS language_name
FROM film
LEFT JOIN language on film.language_id = language.language_id;

SELECT * FROM city;

SELECT first_name, last_name, address, address2, city.city AS city_name, district, postal_code
FROM staff
LEFT JOIN address ON staff.address_id = address.address_id
LEFT JOIN city on address.city_id = city.city_id;



