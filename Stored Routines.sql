/*
	Routine: Process of storing most frequent ask quary so that that quary can be used multiple time without writing it evey single time.
    
    Stored routines:
			- Stored procedures/procedures
            - Functions: Some functions can be create manually which also know as routine
	DELIMITER $$
			- If you use ';' after the DELIMITER then only the first query of the routine will be execute .
              For avoiding that you have to use $$ or // insted of ';'
	
    
    DELIMITER $$
    CREATE PROCEDURE procedure_name(IN perameter_name , perameter_data_type)
    BEGIN
		SELECT * FROM employees
        LIMIT 1000;
	END$$
    DELIMITER ; From this line temporary DELIMITER won't act as a DELIMITER .
*/
USE employees;

DROP PROCEDURE IF EXISTS select_employees;

DELIMITER $$
CREATE PROCEDURE select_employees()
BEGIN
	SELECT
		*
	FROM employees
    LIMIT 10;
END$$
DELIMITER ;	

# CALL database_name.procedure_name();
CALL select_employees();

# Create a procedure that will provide the average salary of all employees. Then, call the procedure.

DELIMITER $$
CREATE PROCEDURE average_salary()
BEGIN
	SELECT 
		ROUND(avg(salary),2) 
	FROM salaries;
END$$
DELIMITER ;

CALL average_salary();

# Take a employe number as input and return his/her salaries throuth out the different promassion and department

DELIMITER $$
CREATE PROCEDURE employee_salary(IN p_emp_no INTEGER)
BEGIN
	SELECT e.first_name , e.last_name , s.salary , s.from_date , s.to_date
    FROM employees e
		INNER JOIN
	salaries s ON s.emp_no = e.emp_no
    WHERE e.emp_no = p_emp_no;
END $$
DELIMITER ;

# Take a employe number as input and return his/her average salary 

DELIMITER $$
CREATE PROCEDURE employee_average_salary(IN p_emp_no INTEGER)
BEGIN
	SELECT e.first_name,e.last_name , AVG(s.salary)
    FROM employees e
		INNER JOIN
	salaries s ON s.emp_no = e.emp_no
    WHERE e.emp_no = p_emp_no
    GROUP BY (e.emp_no);
END $$
DELIMITER ;

CALL employee_average_salary(11300);

# PROCEDURE WITH TWO PERAMETER (IN AND OUT) out parameter represent the variable containing the output value of the operation executed by the query of the stored procedure 
# OUT save the oupput into p_avg_salary

DELIMITER $$
CREATE PROCEDURE employee_average_salary_out(IN p_emp_no INTEGER,OUT p_avg_salary DECIMAL(10,2))
BEGIN
	SELECT  AVG(s.salary)
    INTO p_avg_salary #INTO the OUT PROCEDURE
    FROM employees e
		INNER JOIN
	salaries s ON s.emp_no = e.emp_no
    WHERE e.emp_no = p_emp_no
    GROUP BY (e.emp_no);
END $$
DELIMITER ;


# Menually creating a variable and store the output
SET @v_avg_salary = 0; # SET use for creating a variable 
CALL employee_average_salary_out(11300 , @v_avg_salary);
SELECT @v_avg_salary ;



#Create a procedure called "emp_info" that uses as parameters the first and the last name of an individual, and returns their employee number.

DELIMITER $$
CREATE PROCEDURE emp_info(IN p_first_name VARCHAR(14),IN p_last_name VARCHAR(16) ,OUT p_emp_no INT)
BEGIN
	SELECT e.emp_no
    INTO p_emp_no
    FROM employees e 
    WHERE e.first_name = p_first_name AND e.last_name=p_last_name;
END$$
DELIMITER ;

/*
Create a variable, called "v_emp_no", where you will store the output of the procedure you created in the last exercise.
Call the same procedure, inserting the values "Aruna" and "Journel" as a first and last name respectively.
Finally, select the obtained output.
*/

SET @v_emp_no = 0;
CALL emp_info('Aruna','Journel',@v_emp_no);
SELECT @v_emp_no AS selected_emp_no;
