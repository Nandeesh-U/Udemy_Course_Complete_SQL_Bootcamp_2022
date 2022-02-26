SELECT first_name FROM actor

SELECT last_name, first_name FROM actor

/* the smaller case also works but it is standard practise to write
sql keywords in capital letters*/
select last_name from actor

/* To select all the columns from a table
   SELECT * FROM Table_name */
SELECT * FROM actor

/* DISTINCT */
/* Basic Syntax for DISTINCT Statement
   SELECT DISTINCT column_name FROM table_name */
SELECT * FROM film

SELECT DISTINCT release_year FROM film

SELECT DISTINCT(release_year) FROM film
/* both the above statements does the same thing but using paranthesis
when using distinct statement is suggested practice*/

SELECT DISTINCT rental_rate FROM film

/* COUNT */
/* Basic Syntax for COUNT Statement
   SELECT COUNT(column_name) FROM table_name */
/* COUNT is verry useful when combined with DISTINCT 
   SELECT COUNT(DISTNCT column_name) FROM table_name */
SELECT * FROM payment

SELECT COUNT(*) FROM payment

SELECT amount FROM payment

SELECT DISTINCT amount FROM payment

SELECT COUNT(DISTINCT amount) FROM payment

/* WHERE */
/* Basic syntax for WHERE Statement
   SELECT column 1, column 2
   FROM table
   WHERE conditions */
   
SELECT * FROM customer

SELECT * FROM customer
WHERE first_name = 'Jared'

SELECT * FROM film
WHERE rental_rate > 4 AND replacement_cost >= 19.99
AND rating = 'R'

SELECT COUNT(*) FROM film
WHERE rental_rate > 4 AND replacement_cost >= 19.99
AND rating = 'R'

SELECT * FROM film
WHERE rating = 'R' OR rating = 'PG-13'


SELECT * FROM film
WHERE rating != 'R'

/* ORDER BY */
/* Basic Syntax for ORDER BY Statement
   SELECT column 1, column 2
   FROM table
   ORDER BY column 1 ASC/DESC */

SELECT * FROM customer
ORDER BY first_name

SELECT store_id,first_name,last_name FROM customer
ORDER BY store_id

SELECT store_id,first_name,last_name FROM customer
ORDER BY store_id,first_name

SELECT store_id,first_name,last_name FROM customer
ORDER BY store_id DESC,first_name ASC

/* LIMIT */
/* Basic Syntax for LIMIT Statement
   SELECT column 1 
   FROM table
   ORDER BY column 2 
   LIMIT n */

SELECT * FROM payment
LIMIT 1

SELECT * FROM payment
WHERE amount != 0
ORDER BY payment_date DESC
LIMIT 5

/* BETWEEN */
SELECT * FROM payment
WHERE amount BETWEEN 8 and 9
/* includes 8 and 9*/

SELECT * FROM payment
WHERE payment_date BETWEEN '2007-02-01' AND '2007-02-15'

SELECT * FROM payment
WHERE payment_date BETWEEN '2007-02-01' AND '2007-02-14'

/* Note that the above two statements produce different outputs though
all the dates in the output of the first query are on 14th feb only
This happens because the date in SQL starts at 00 hours and not
23:59:59 hours*/

/* IN */
/* Basic syntax of IN Statement
   SELECT column 1 
   FROM table
   WHERE column 1 IN (value 1, value 2) */
   
SELECT * FROM payment

SELECT DISTINCT amount FROM payment
ORDER BY amount

SELECT * FROM payment
WHERE amount IN(0.99,1.99,1.98)

SELECT * FROM customer
WHERE first_name IN('John','Jake','Julie')


/* EXTRA NOTES:
the tables in the SQL views are virtual tables(not actual tables,
not complex tables, not simple tables)*/

/* LIKE & ILIKE */
SELECT * FROM customer
WHERE first_name LIKE 'J%'

SELECT * FROM customer
WHERE first_name LIKE 'J%' AND last_name LIKE 'S%'

SELECT * FROM customer
WHERE first_name LIKE 'j%' AND last_name LIKE 's%'

SELECT * FROM customer
WHERE first_name ILIKE 'j%' AND last_name ILIKE 's%'

SELECT * FROM customer
WHERE first_name LIKE '%er%'

/* Note that in the above query, Jennifer will also be selected. It means
that % includes '0' characters also!*/

SELECT * FROM customer
WHERE first_name LIKE '_er%'

SELECT * FROM customer
WHERE first_name LIKE 'A%' 
ORDER BY last_name

/* AGGREGATE FUNCTIONS */
SELECT * FROM film

SELECT MIN(replacement_cost) FROM film

SELECT MAX(replacement_cost),replacement_cost FROM film

SELECT MAX(replacement_cost),MIN(replacement_cost) FROM film

SELECT AVG(replacement_cost) FROM film
SELECT ROUND(AVG(replacement_cost),3) FROM film

SELECT SUM(replacement_cost) FROM film

SELECT COUNT(*) FROM film

/* GROUP BY */
/* Basic Syntax
   SELECT category_column_name, AGG(data_column_name) FROM table_name
   GROUP BY category_column_name
	
   SELECT category_column_name, AGG(data_column_name) FROM table_name
   WHERE category_column_name CONDITION
   GROUP BY category_column_name */
   
SELECT * FROM payment

SELECT customer_id FROM payment
GROUP BY customer_id

SELECT customer_id, SUM(amount) FROM payment
GROUP BY customer_id
ORDER BY SUM(amount)

SELECT customer_id, staff_id, SUM(amount) FROM payment
GROUP BY customer_id, staff_id
ORDER BY customer_id

SELECT DATE(payment_date),SUM(amount),MIN(amount) FROM payment
GROUP BY DATE(payment_date)
ORDER BY SUM(amount)

/* HAVING */
SELECT * FROM payment

SELECT customer_id, SUM(amount) FROM payment
GROUP BY customer_id

SELECT customer_id, SUM(amount) FROM payment
WHERE customer_id NOT IN (184,87,477)
GROUP BY customer_id

SELECT customer_id, SUM(amount) FROM payment
GROUP BY customer_id
HAVING SUM(amount) > 200

SELECT store_id, COUNT(customer_id) FROM customer
GROUP BY store_id
HAVING COUNT(customer_id) > 300

/* AS */
SELECT COUNT(amount) FROM payment

SELECT COUNT(amount) AS num_transactions FROM payment 

SELECT customer_id, SUM(amount) AS total_spent FROM payment
GROUP BY customer_id
HAVING total_spent > 100

SELECT customer_id, SUM(amount) AS total_spent FROM payment
GROUP BY customer_id
HAVING SUM(amount) > 100

/* INNER JOIN */
/* Basic Syntax
   SELECT * FROM TableA
   INNER JOIN TableB
   ON TableA.col = TableB.col */
   
SELECT * FROM payment
INNER JOIN customer
ON payment.customer_id = customer.customer_id

SELECT payment_id, customer.customer_id, first_name FROM payment
INNER JOIN customer
ON payment.customer_id = customer.customer_id

/* FULL OUTER JOIN */
/* Basic Syntax
   SELECT * FROM TableA
   FULL OUTER JOIN TableB
   ON TableA.col = TableB.col */

/* SELECT * FROM TableA
   LFT OUTER JOIN TableB
   ON TableA.col = TableB.col 
   WHERE TableA.col IS NULL or TableB.col IS NULL */

SELECT * FROM payment
SELECT * FROM customer

SELECT * FROM payment
FULL OUTER JOIN customer
ON payment.customer_id = customer.customer_id

SELECT * FROM payment
FULL OUTER JOIN customer
ON payment.customer_id = customer.customer_id
WHERE customer.customer_id IS NULL OR payment.payment_id IS NULL

SELECT COUNT(DISTINCT customer_id) FROM payment
SELECT COUNT(DISTINCT customer_id) FROM customer


/* LEFT OUTER JOIN */
/* Basic Syntax
   SELECT * FROM TableA
   LEFT OUTER JOIN TableB
   ON TableA.col = TableB.col */

/* SELECT * FROM TableA
   LEFT OUTER JOIN TableB
   ON TableA.col = TableB.col 
   WHERE TableB.col IS NULL */

SELECT * FROM film
SELECT * FROM inventory

SELECT film.film_id, title, inventory_id,store_id FROM film
LEFT OUTER JOIN inventory
ON inventory.film_id = film.film_id

SELECT film.film_id, title, inventory_id,store_id FROM film
LEFT OUTER JOIN inventory
ON inventory.film_id = film.film_id
WHERE inventory.film_id IS NULL

/* We can join more than 2 tables also using join method */
/* order of statements - select, where, groupby, having*/
ot