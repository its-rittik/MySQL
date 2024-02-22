#Practicing using eployee DataBase
USE employees;

#Select number of selected column from the Employees table
SELECT first_name , last_name 
FROM employees;

#Select all the column from employees table
SELECT 
	* 
FROM employees;


#Select the record of a column when a certain condition is True
SELECT 
	* 
FROM 
	employees
WHERE 
	(first_name = 'Denis' OR first_name = 'Elvis' OR first_name = 'Mark') #If there is more then two conditon can use -> IN('Denis','Mark','Mathan')
		AND gender = 'M'; #AND use for combain two condition in where statement
    
### BETWEEN....AND -> set range of data value 
#not used only for data values , could also applied to strings and numbers
#NOT BETWEEN....AND -> will do the oposite of this

SELECT
	*
FROM 
	employees
WHERE 
	hire_date BETWEEN '1996-04-07' AND '1997-04-07';


### IS NOT NULL / IS NULL
SELECT 
    *
FROM
    employees
WHERE
    first_name IS NOT NULL; #select all the employees whos first+name is not null

/*
MATHMATICAL OPERATION SIGN
	NOT EQUAL   <> , !=	
*/

### SELECT NON DUPLICATE VALUES ONLY
SELECT DISTINCT
    gender
FROM
    employees; 
    
### AGGREGATE FUNCTIONS -> COUNT(), SUM() , MIN() , MAX() , AVG()
#Note : Aggregate function ignore null values
SELECT
	COUNT(DISTINCT first_name) #select the non-duplicate name from the DataBase
FROM 
	employees;

### ORDER BY 
/*
SELECT * FROM table_name 
ORDER BY column_name ASC/DESC; ASC -> Asending order , DESC -> Desending order

For sorting two column : 
		
        ORDER BY column1 , column2  ASC/DESC; If you want ASC for 1st column and DESE for 2nd then type : column1 ASC, column2 DESC;
*/

SELECT 
    *
FROM
    employees
ORDER BY first_name, last_name DESC;


### GROUP BY

/*
    SELECT column_name(s)
    FROM table_name
    WHERE conditions
    GROUP BY column_name(s)
    ORDER BY column_name(s)
*/
SELECT 
    COUNT(first_name)
FROM
    employees
GROUP BY first_name;

#Basic Thum rule . If you use Aggregate function always write the column name before Aggregate function
SELECT 
    first_name, COUNT(first_name) AS names_count #Aliases (AS) re-write the column name  
FROM
    employees
GROUP BY first_name
ORDER BY first_name DESC;

### HAVING
/*
	SELECT column_name(s)
    FROM table_name
    WHERE conditions
    GROUP BY column_name(s)
    HAVING consitions
    ORDER BY column_name(s)
    LIMIT n; # Print n rows in the display and always have to write at the end 
    
    1.HAVING is like WHERE but aoolied to the GROUP BY block
    2.after HAVING , you can have a condition with an AGGREGATE Function, 
    while WHERE can't use aggregate function within its conditions.
    3. Aggregate and Non- aggregate function both can't apply in HAVING at the same time
*/
 
SELECT 
    first_name, COUNT(first_name)
FROM
    employees
WHERE
    COUNT(first_name) > 250 #Will show a error
GROUP BY first_name;

SELECT 
    first_name, COUNT(first_name)
FROM
    employees
GROUP BY first_name
HAVING COUNT(first_name) > 250
ORDER BY first_name
LIMIT 100;


SELECT 
    emp_no, AVG(salary)
FROM
    salaries
WHERE
    salary > 120000
GROUP BY emp_no
ORDER BY emp_no;

# When using WHERE instead of HAVING, the output is larger because in the output we include individual contracts higher than $120,000 per year. 
# The output does not contain average salary values.
SELECT 
    emp_no, AVG(salary)
FROM
    salaries
GROUP BY emp_no
HAVING AVG(salary) > 120000
ORDER BY emp_no;

#Select the employee numbers of all individuals who have signed more than 1 contract after the 1st of January 2000.
SELECT 
    emp_no, COUNT(dept_no) AS dept_number
FROM
    dept_emp
WHERE
    from_date < '2000-01-01'
GROUP BY emp_no
HAVING COUNT(dept_no) > 1
ORDER BY emp_no
LIMIT 10; 
