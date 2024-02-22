/*
	JOINS 
		- If a certain condition is satisfied (two table has a related column (column with same name and data type))
				then some column from two table can be joined and extract data from it
*/
USE employees;

/*
        Syntex:
			SELECT
				table_1.column_name(s) , table_2.column_name(s)
			FROM
				table_1 
			JOIN
				table_2  ON table_1.colimn_name = table_2.column_name;
            
            ----------------------------------------------------------
            
			SELECT
				t1.column_name(s) , t2.column_name(s)
			FROM
				table_1 t1 #same as table_1 AS t1
			JOIN
				table_2 t2 ON t1.colimn_name = t2.column_name;
*/

/*
INNER JOIN:
		-Join only the matching column
        -inner join extract only records in which the values in the related columns match
        -null values or values appearing in just one of the two table and not appearing in the pther , are not displayed
*/

SELECT 
    m.dept_no, m.emp_no, d.dept_name
FROM
    dept_manager_dup m
        INNER JOIN
    department_dup d ON m.dept_no = d.dept_no
ORDER BY m.emp_no;
    
# EX: Extract a list containing information about all managers' employee number, first and last name, department number, and hire date.
SELECT 
    m.emp_no, e.first_name, e.last_name, m.dept_no, e.hire_date
FROM
    dept_manager_dup m
        INNER JOIN
    employees e ON m.emp_no = e.emp_no;