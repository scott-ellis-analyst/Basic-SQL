CREATE VIEW unique_film AS
SELECT title,
	release_year,
	language_id,
	rental_duration
FROM film
GROUP BY title,
	release_year,
	language_id,
	rental_duration