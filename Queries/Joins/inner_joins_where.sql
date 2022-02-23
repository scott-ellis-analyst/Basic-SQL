SELECT
	A.country,
	COUNT(customer_id)
FROM country A
INNER JOIN city B ON A.country_id = B.country_id
INNER JOIN address C ON B.city_id = C.city_id
INNER JOIN customer D ON C.address_id = D.address_id
WHERE country IN
	('India',
	'China',
	'United States',
	'Japan',
	'Mexico',
	'Brazil',
	'Russian Federation',
	'Phillipines',
	'Turkey',
	'Indonesia')
GROUP BY A.country, B.city
ORDER BY COUNT(customer_id) DESC
LIMIT 10;