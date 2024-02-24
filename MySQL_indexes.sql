/*
	CREATE INDEX index_name
	ON table_name (column_1 , column_2 , .....);
*/

SELECT 
    *
FROM
    employees
WHERE
    hire_date > '2000-01-01';
    
CREATE INDEX i_hire_date ON employees(hire_date); #After creating an index of employees table and hire_date column the quary will run faster

/*	
  COMPOSITE INDEX: apply to multiple column, not just a single one 
*/

SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Rittik'
        AND last_name = 'Turjy';

CREATE INDEX i_first_last_name ON employees(first_name , last_name);
/*
Assignment

Task 1: Drop the ‘i_hire_date’ index.

Task 2: Select all records from the ‘salaries’ table of people whose salary is higher than $89,000 per annum.
Then, create an index on the ‘salary’ column of that table, and check if it has sped up the search of the same SELECT statement.
*/
#1
DROP INDEX i_hire_date ON employees;

#2
SELECT 
    *
FROM
    salaries
WHERE
    salary > 89000;
    
CREATE INDEX i_salary ON salaries(salary);