/*
COUNT 
	1. Ignore NULL values
    ex: SELECT 
			COUNT(DISTINCT from_date)
		FROM
			salaries;
    2. If you run COUNT(*) count null value also
    ex: SELECT
			COUNT(*)
		FROM 
			salaries;
	3. * only can be applied on COUNT() function , both numeric and non-numeric data
*/

USE employees;


SELECT 
	COUNT(DISTINCT from_date)
FROM
	salaries;

SELECT
	COUNT(*)
FROM 
	salaries;

/*
ROUND()
	ROUND(AVG()) -> Print the closest integer of the float number
    ROUND(AVG(),n) -> n define the number of digit after decimal point
*/

SELECT
	ROUND(AVG(salary),2)
FROM 
	salaries;

/*
										ISNULL() and COALESCE()
By using IFNULL() we can insert a string if value is NULL .
EX:  	SELECT
            IFNULL(column_name,'MSG you want to show if cell is NULL')
		FROM 
			table_name;
IFNULL() can handel more then two parameter . That's why have to use COALESCE()
ex:		SELECT
			COALESCE(column_1 , column_2 , 'N/A') 
		FROM 
			table_name;
		If cell of the 1st column is Null then it will check 2nd column cell . 
									If 2nd column cell is not null then it will replace 1st column cell with 2nd column cell values
                                    Else it will repace 1st column value with the not null value in the consition is this case 'N/A' 
*/

SELECT
	dept_no,
    IFNULL(dept_name ,
			'Department name not provided') AS dept_name
FROM
	departments
ORDER BY dept_no ;