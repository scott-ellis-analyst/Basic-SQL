CREATE TABLE employees
(
	employee_id serial NOT NULL,
	name VARCHAR(50),
	contact_number INT,
	designation_id INT,
	last_update TIMESTAMP NOT NULL DEFAULT NOW(),
	CONSTRAINT employees_pkey PRIMARY KEY (employee_id)
);