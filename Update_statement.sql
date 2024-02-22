# commit -> used to save the state of the data in the database at the moment of its execution
# rollback -> it will refer to the state corresponding to the last time you executed commit

/*
UPDATE table_name
SET column_1 = value_1 , column_2 = value_2.....
WHERE conditions;
*/

USE enployees;

UPDATE employees
SET
	last_name = 'Turjy',
    birth_date = '2003-02-12'
WHERE 
	emp_no = 999903;

# WHERE is not mendatory . If you don't use WHERE entire column will updated 

COMMIT; # if you accundentaly change anything in database COMMIT help to store the very last changes. 

UPDATE employees
SET
	last_name = 'Turjy';

ROLLBACK; #rollback help to resote the commited section . if you don't commit anything then rollback will take you to the very fast stage (when you create the table)





#EX: Change the "Business Analysis" department name to "Data Analysis".

UPDATE departments
SET
	dept_name = 'Data Analysis'
WHERE
	dept_no = 'd010';


SELECT 
	*
FROM
	departments;

