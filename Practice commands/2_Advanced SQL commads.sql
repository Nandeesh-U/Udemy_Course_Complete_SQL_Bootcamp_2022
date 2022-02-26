SHOW TIMEZONE;

SELECT NOW();

SELECT TIMEOFDAY();

SELECT CURRENT_TIME;

SELECT CURRENT_DATE;

-- Extract function
SELECT EXTRACT(YEAR FROM payment_date),EXTRACT(MONTH FROM payment_date) FROM payment;

SELECT AGE(payment_date) FROM payment;
/* RETURNS THE AGE OF THE GIVEN TIMESTAMP IN ARGUMENT*/

SELECT TO_CHAR(payment_date,'DD Mon YY') FROM payment;
SELECT TO_CHAR(payment_date,'DD Mon ][][][     shove   YY') FROM payment;
SELECT TO_CHAR(payment_date,'DD Mon ][][][     bullshit   YY') FROM payment;
-- TO_CHAR basically takes any type of data and converts it into a string format
-- It not only works on datetime format, it also works for some other formats
-- Look for TO_CHAR documentation for more uses


----- VERY VERY GOOD EXAMPLE OF SELF JOIN AND IMPORTANT
SELECT f1.title, f2.title, f1.length
FROM film AS f1
INNER JOIN film AS f2
ON f1.film_id != f2.film_id
AND f1.length = f2.length;