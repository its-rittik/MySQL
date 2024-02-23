/*
									FUNCTION VS PROCEDURE
			- Function does not have any out perameter all the perameter are in perameter 
             
             DELIMITER $$
             CREATE FUNCTIONS function_name(PARAMETER data_type) RETURNS data_type
             BEGIN
             DECLARE variable_name data_type
				SELECT .....
			 RETURN variable_name
             END $$
             DELIMITER ;
             
*/
USE Employees;


DELIMITER $$
CREATE FUNCTION f_emp_avg_salary (p_emp_no INTEGER) RETURNS DECIMAL(10,2)
DETERMINISTIC #If error code 1418 appears use DETERMINSTIC , NO SQL , READS SQL DATA
BEGIN
DECLARE v_avg_salary DECIMAL(10,2);

SELECT 
    AVG(s.salary)
INTO v_avg_salary FROM
    employees e
        JOIN
    salaries s ON e.emp_no = s.emp_no
WHERE
    p_emp_no = e.emp_no;
RETURN v_avg_salary;
END$$
DELIMITER ;

SELECT F_EMP_AVG_SALARY(11300);


/* ASSIGNMENT:
Create a function called "emp_info" that takes for parameters the first and last name of an employee, and returns the salary from the newest contract of that employee.
Finally, select this function.
*/

DELIMITER $$
CREATE FUNCTION emp_info (p_first_name VARCHAR(255) , p_last_name VARCHAR(255)) RETURNS DECIMAL(10,2)
DETERMINISTIC 
BEGIN
DECLARE v_max_date DATE ;
DECLARE v_avg_salary DECIMAL(10,2);

SELECT 
    MAX(s.from_date)
INTO v_max_date FROM
    employees e
        JOIN
    salaries s ON s.emp_no = e.emp_no
WHERE
    p_first_name = e.first_name
        AND p_last_name = e.last_name;

SELECT 
    ROUND(AVG(s.salary), 2)
INTO v_avg_salary FROM
    employees e
        JOIN
    salaries s ON e.emp_no = s.emp_no
WHERE
    p_first_name = e.first_name
        AND p_last_name = e.last_name
        AND s.salary <= v_max_date;
RETURN v_avg_salary;

END$$
DELIMITER ;

SET @v_first_name = 'Parto';
SET @v_last_name = 'Bamford';

SELECT 
    emp_no,
    first_name,
    last_name,
    EMP_INFO(@v_first_name, @v_last_name) AS last_hiring_salary
FROM
    employees e
WHERE
    e.first_name = @v_first_name
        AND e.last_name = @v_last_name; #In PROCEDURE can't print like this 