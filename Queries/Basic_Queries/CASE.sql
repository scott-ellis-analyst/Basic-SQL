SELECT rating,
	MIN(replacement_cost) AS min_replacement_cost,
	MAX(replacement_cost) AS max_replacement_cost
FROM film
GROUP BY rating
ORDER BY CASE WHEN rating = 'G' THEN 1
	WHEN rating = 'PG' THEN 2
	WHEN rating = 'PG-13' THEN 3
	WHEN rating = 'R' THEN 4
	WHEN rating = 'NC-17' THEN 5
END;