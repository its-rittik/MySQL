/*
A type of stored program, associated with a table , that will be activated automatically once a specific event occurs.
This event must be related to the associated table and represented by one of the following three DML statement
	- INSERT
    - UPDATE
    - DELETE
A trigger is a MySql object that can trigger a specific action or calculation BEFORE or AFTER those DML statement has been executed.
*/

USE employees;

COMMIT;

#BEFORE INSERT

DELIMITER $$
CREATE TRIGGER before_salaries_insert
BEFORE INSERT ON salaries
FOR EACH ROW #means all row will be affected after the tigger activated 
BEGIN 
	IF NEW.salary < 0 THEN  # NEW keyword : it refer to the row that just been updated 
		SET NEW.salary = 0 ; # SET keyword : we use it when we have to insert a certain value in a variable 
	END IF; 
END$$

DELIMITER ;

INSERT INTO salaries VALUES('10001', -92891 , '2010-06-22','2026-10-10');

SELECT 
    *
FROM
    salaries
WHERE
    emp_no = '10001';
    
#UPDATE tiggers

DELIMITER $$
CREATE TRIGGER before_salaries_update
BEFORE UPDATE ON salaries
FOR EACH ROW
BEGIN
	IF NEW.salary < 0 THEN
		SET NEW.salary = OLD.salary;
	END IF;
END $$
DELIMITER ;

#update the salary with positive value
UPDATE salaries 
SET 
    salary = 98765
WHERE
    emp_no = '10001'
        AND from_date = '2010-06-22';

SELECT 
    *
FROM
    salaries
WHERE
    emp_no = '10001'
        AND from_date = '2010-06-22';
        
#update the salaries with a negative values
UPDATE salaries 
SET 
    salary = -50000
WHERE
    emp_no = '10001'
        AND from_date = '2010-06-22';

SELECT 
    *
FROM
    salaries
WHERE
    emp_no = '10001'
        AND from_date = '2010-06-22';
        
#AFTER

DELIMITER $$
CREATE TRIGGER new_manager_salary
AFTER INSERT ON dept_manager
FOR EACH ROW
BEGIN
	DECLARE v_manager_salary int;
SELECT 
    MAX(salary)
INTO v_manager_salary FROM
    salaries
WHERE
    emp_no = NEW.emp_no;
IF v_manager_salary IS NOT NULL THEN 
	UPDATE salaries
    SET
		to_date = SYSDATE()
	WHERE
		emp_no = NEW.emp_no AND to_date = NEW.to_date;
	
    INSERT INTO salaries 
		VALUES (NEW.emp_no , v_manager_salary + 20000 , NEW.from_date , NEW.to_date);
END IF;
END$$
DELIMITER ;

INSERT INTO dept_manager VALUES('111534','d009' ,date_format(sysdate(), '%y-%m-%d'),'9999-01-01');

SELECT 
	*
FROM 
	salaries 
	WHERE
		emp_no = '11154';
	
    
#ASSIGNMENT : Create a trigger that checks if the hire date of an employee is higher than the current date. If true, set this date to be the current date. Format the output appropriately (YY-MM-DD).

DELIMITER $$
CREATE TRIGGER update_date 
BEFORE INSERT ON employees
FOR EACH ROW
BEGIN
	IF NEW.hire_date > date_format(SYSDATE() , '%y-%m-%d') THEN
		SET NEW.hire_date = date_format(SYSDATE() , '%y-%m-%d');
	END IF;
END$$
DELIMITER ;

INSERT INTO employees 
VALUES('12012105' ,'2002-01-12','Ritti','Turjoy','M','2024-12-03');

SELECT 
    *
FROM
    employees
WHERE
    emp_no = '12012105';