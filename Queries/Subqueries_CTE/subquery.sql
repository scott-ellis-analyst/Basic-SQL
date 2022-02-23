SELECT
	country.country,
	COUNT(DISTINCT customer.customer_id) AS all_customer_count,
	COUNT(DISTINCT top_5.customer_id) AS top_customer_count
FROM country 
INNER JOIN city  ON country.country_id = city.country_id
INNER JOIN address ON city.city_id = address.city_id
INNER JOIN customer ON address.address_id = customer.address_id
LEFT JOIN
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
	 LIMIT 5) AS top_5 ON top_5.country = country.country
GROUP BY country.country
ORDER BY top_customer_count DESC;

