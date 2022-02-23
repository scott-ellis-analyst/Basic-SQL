WITH top_5_cte (amount) AS
	(SELECT
		E.customer_id,
		D.first_name,
		D.last_name,
		A.country,
		B.city,
		SUM(E.amount) AS total_paid
	FROM country A
	INNER JOIN city B ON A.country_id = B.country_id
	INNER JOIN address C ON B.city_id = C.city_id
	INNER JOIN customer D ON C.address_id = D.address_id
	INNER JOIN payment E ON D.customer_id = E.customer_id
	WHERE country IN
	 ('India','China','United States','Japan','Mexico','Brazil','Russian Federation','Phillipines',
	  'Turkey','Indonesia')
	 AND city IN
	 ('Aurora','Acua','Citrus Heights','Iwaki','Ambattur','Shanwei','So Leopoldo','Teboksary',
	 'Tianjin','Cianjur')
	 GROUP BY
	 	E.customer_id,
	 	D.first_name,
	 	D.last_name,
	 	A.country,
	 	B.city
	 ORDER BY total_paid DESC
	 LIMIT 5)
SELECT AVG(total_paid) AS average_top_5
FROM top_5_cte
