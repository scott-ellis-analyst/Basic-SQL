SELECT
	COUNT(customer_id) AS id_count,
	COUNT(store_id) AS store_count,
	COUNT(first_name) AS first_count,
	COUNT(last_name) AS last_count,
	COUNT(email) AS email_count,
	COUNT(address_id) AS address_count,
	COUNT(activebool) AS bool_count,
	COUNT(create_date) AS create_count,
	COUNT(last_update) AS update_count,
	COUNT(active) AS active_count
FROM customer