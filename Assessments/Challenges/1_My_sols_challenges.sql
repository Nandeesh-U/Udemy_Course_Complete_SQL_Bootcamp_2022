SELECT first_name, last_name, email FROM customer;

SELECT DISTINCT(rating) FROM film;

SELECT email FROM customer
WHERE first_name = 'Nancy' AND last_name = 'Thomas';

SELECT description FROM film
WHERE title = 'Outlaw Hanky';

SELECT phone FROM address
WHERE address = '259 Ipoh Drive';

SELECT customer_id FROM payment
ORDER BY payment_date
LIMIT 10;

SELECT title FROM film
ORDER BY film.length
LIMIT 5;

SELECT COUNT(*) FROM film
WHERE length <= 50;

SELECT COUNT(*) FROM payment
WHERE amount>5;

SELECT COUNT(*) FROM actor
WHERE first_name LIKE 'P%';

SELECT COUNT(DISTINCT(district)) FROM address;
SELECT DISTINCT(district) FROM address;

SELECT COUNT(*) FROM film
WHERE (rating='R') AND (replacement_cost BETWEEN 5 AND 15);

SELECT COUNT(*) FROM film
WHERE title ILIKE '%TRUMAN%';

SELECT staff_id, COUNT(amount)
FROM payment
GROUP BY staff_id;

SELECT rating, ROUND(AVG(replacement_cost),2)
FROM film
GROUP BY rating;

SELECT customer_id, SUM(amount)
FROM payment
GROUP BY customer_id
ORDER BY SUM(amount) DESC
LIMIT 5;

SELECT customer_id, COUNT(customer_id)
FROM payment
GROUP BY customer_id
HAVING COUNT(customer_id)>=40;

SELECT staff_id, customer_id, SUM(amount)
FROM payment
WHERE staff_id =2
GROUP BY staff_id,customer_id
HAVING SUM(amount)>100;

-- Join tasks
SELECT email
FROM customer
INNER JOIN address
ON customer.address_id = address.address_id
WHERE district = 'California';

SELECT * FROM film;
SELECT * FROM actor;
SELECT * FROM film_actor;

SELECT first_name,last_name,title
FROM film_actor
INNER JOIN actor
ON film_actor.actor_id = actor.actor_id
INNER JOIN film
ON film.film_id = film_actor.film_id
WHERE first_name = 'Nick' AND last_name = 'Wahlberg';

SELECT DISTINCT(TO_CHAR(payment_date,'Month')) FROM payment;

SELECT COUNT(TO_CHAR(payment_date,'Day')) FROM payment
WHERE TO_CHAR(payment_date,'Day') = 'Monday   ';