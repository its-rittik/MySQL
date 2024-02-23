# SQL view - a virtual table whose contents are obtained from an existing table or tables, called base table
/*
		CREATE VIEW view_name AS
        SELECT
			column_1 , column_2 ,....,Column_n
		FROM
			table_name;
		#Usally view_name start with V_ , W_ which means this is a view table
        #Don't forget they are not real , physical data sets, meaning we can't insert or update the information that has already been ectracted.
			They should be seen as temporary virtual data tables retreving information from base table
*/

#Normal select statement
SELECT 
    emp_no, MAX(from_date) AS from_date, MAX(to_date) AS to_date
FROM
    dept_emp
GROUP BY emp_no;


#View statement
CREATE VIEW v_dept_emp_latest_date AS
    SELECT 
        emp_no, MAX(from_date) AS from_date, MAX(to_date) AS to_date
    FROM
        dept_emp
    GROUP BY emp_no;


DROP VIEW v_avg_salary_of_manager;

/* Create a view that will extract the average salary of all managers registered in the database.
 Round this value to the nearest cent. If you have worked correctly, after executing the view from the “Schemas” section in Workbench,
 you should obtain the value of 66924.27. */

CREATE VIEW v_avg_salary_of_manager AS
    SELECT 
        ROUND(AVG(s.salary), 2)
    FROM
        salaries s
            JOIN
        dept_manager dm ON dm.emp_no = s.emp_no; 
