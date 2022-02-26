CREATE TABLE students(
	student_id SERIAL PRIMARY KEY,
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50),
	homeroom_number INTEGER CHECK(homeroom_number> 0),
	phone TEXT UNIQUE NOT NULL,
	email VARCHAR(100) UNIQUE,
	graduation_year INTEGER NOT NULL CHECK(graduation_year>1901)
);

SELECT * FROM students;

CREATE TABLE teachers(
	teacher_id SERIAL PRIMARY KEY,
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50),
	homeroom_number INTEGER CHECK(homeroom_number> 0),
	department VARCHAR(50) NOT NULL,
	email VARCHAR(100) UNIQUE,	
	phone TEXT UNIQUE NOT NULL
);

SELECT * FROM teachers;

INSERT INTO students(first_name, last_name, homeroom_number, phone,graduation_year)
VALUES
('Mark','Waltney',5,'777-555-1234',2035);

INSERT INTO teachers(first_name, last_name, homeroom_number, department,email, phone)
VALUES
('Jonas','Salk',5, 'Biology', 'jsalk@school.org','777-555-4321');