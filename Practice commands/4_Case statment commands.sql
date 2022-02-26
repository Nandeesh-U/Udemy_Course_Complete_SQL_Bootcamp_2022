SELECT customer_id,
CASE
	WHEN (customer_id <= 100) THEN 'PREMIUM'
	WHEN (customer_id BETWEEN 101 AND 200) THEN 'PLUS'
	ELSE 'NORMAL'
END AS customer_class,
CASE customer_id
	WHEN 2 THEN 'WINNER'
	WHEN 5 THEN 'RUNNER UP'
	ELSE 'LOSER'
END AS lottery_result
FROM customer;

SELECT
SUM(CASE rental_rate
	WHEN 0.99 THEN 1
	ELSE 0
END) AS bargains,
SUM(CASE rental_rate
	WHEN 2.99 THEN 1
	ELSE 0
END) AS regular,
SUM(CASE rental_rate
	WHEN 4.99 THEN 1
	ELSE 0
END) AS premium
FROM film;