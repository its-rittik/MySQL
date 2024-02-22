USE employees;


#Method 1 -> Create table
CREATE TABLE department_dup(
	dept_no CHAR(4) NOT NULL,
    dept_name VARCHAR(40) DEFAULT NULL,
PRIMARY KEY (dept_no),
UNIQUE KEY (dept_name)
);

INSERT INTO department_dup
SELECT 
	*
FROM 
	departments;

    
#Method 2 
CREATE TABLE dept_manager_dup AS 
SELECT 
	* 
FROM
    dept_manager;

    
INSERT INTO dept_manager_dup
SELECT 
	*
FROM 
	dept_manager;
    

INSERT INTO dept_manager_dup(emp_no,from_date)
VALUES
	(999904 , '2017-01-01'),
    (999905 , '2017-01-01'),
    (999906 , '2017-01-01'),
    (999907 , '2017-01-01');


SELECT 
	*
FROM 
	dept_manager_dup
ORDER BY emp_no DESC;