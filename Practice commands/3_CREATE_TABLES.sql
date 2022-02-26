CREATE TABLE account(
	user_id SERIAL PRIMARY KEY,
	username VARCHAR(50) UNIQUE NOT NULL,
	password VARCHAR(50) NOT NULL,
	email VARCHAR(250) UNIQUE NOT NULL,
	created_on TIMESTAMP NOT NULL,
	last_login TIMESTAMP
);

CREATE TABLE job(
	job_id SERIAL PRIMARY KEY,
	job_name VARCHAR(200) UNIQUE NOT NULL
);

CREATE TABLE account_job(
	user_id INTEGER REFERENCES account(user_id),
	job_id INTEGER REFERENCES job(job_id),
	hire_date TIMESTAMP
);

INSERT INTO account(username, password,email, created_on)
VALUES
('Nandeesh','dfsdjkhsdf','nandeesh@gmail.com',CURRENT_TIMESTAMP);

SELECT * FROM account;
SELECT * FROM job;

INSERT INTO job(job_name)
VALUES
('Astronaut');

INSERT INTO job(job_name)
VALUES
('Engineer');

SELECT * FROM account_job;

INSERT INTO account_job(user_id, job_id, hire_date)
VALUES
(1,1,CURRENT_TIMESTAMP);

INSERT INTO account_job(user_id, job_id, hire_date)
VALUES
(501,782,CURRENT_TIMESTAMP);


SELECT * FROM account;

UPDATE account
SET last_login = CURRENT_TIMESTAMP;

UPDATE account
SET last_login = created_on;

SELECT * FROM account_job;

UPDATE account_job
SET hire_date = account.created_on
FROM account
WHERE account_job.user_id = account.user_id;

UPDATE account
SET last_login = CURRENT_TIMESTAMP
RETURNING email, created_on, last_login;

SELECT * FROM job;

INSERT INTO job(job_name)
VALUES
('Shitlifter');

DELETE FROM job
WHERE job_name = 'Shitlifter'
RETURNING *;

CREATE TABLE information(
	info_id SERIAL PRIMARY KEY,
	title VARCHAR(500) NOT NULL,
	person VARCHAR(50) NOT NULL UNIQUE
);

SELECT * FROM information;

ALTER TABLE information
RENAME TO new_info;

SELECT * FROM information;
SELECT * FROM new_info;

ALTER TABLE new_info
RENAME COLUMN person to people;

INSERT INTO new_info(title)
VALUES
('some random title');

ALTER TABLE new_info
ALTER COLUMN people DROP NOT NULL;

INSERT INTO new_info(title)
VALUES
('some random title');

ALTER TABLE new_info
DROP COLUMN people;

ALTER TABLE new_info
DROP COLUMN IF EXISTS people;

-- CHECK CONSTRAINT
CREATE TABLE employees(
	emp_id SERIAL PRIMARY KEY,
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	birthday DATE CHECK (birthday > '1900-01-01'),
	hire_date DATE CHECK (hire_date> birthday),
	salary INTEGER CHECK (salary > 0)
);

SELECT * FROM employees;

INSERT INTO employees(first_name, last_name, birthday, hire_date, salary)
VALUES
('Sri','Rama','2100-01-01','2901-01-01',4000);