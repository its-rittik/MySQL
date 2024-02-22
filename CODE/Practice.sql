CREATE DATABASE IF NOT EXISTS university ;

USE university;

CREATE TABLE student(
	student_id INT NOT NULL ,
	first_name VARCHAR(255) ,
    email VARCHAR(255),
    cgpa FLOAT,
PRIMARY KEY (student_id)
);

CREATE TABLE cources(
	student_id INT NOT NULL,
    cource_code VARCHAR(255),
    cource_teacher VARCHAR(255),
PRIMARY KEY (student_id),
FOREIGN KEY (student_id) REFERENCES student(student_id) ON DELETE CASCADE
);

ALTER TABLE student
    CHANGE COLUMN cgpa cgpa FLOAT DEFAULT 0.0,
    CHANGE COLUMN email email VARCHAR(255) UNIQUE;
    
INSERT INTO student 
VALUES
(6289 , 'Rittik','rittikdas@gmail.com',03.89),
(6155 , 'Sarbajit','bappy@gmail.com',03.86);

SELECT 
	*
FROM
	student
ORDER BY student_id DESC;

DROP database university;