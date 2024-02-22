 /*
 DELETE FROM table_name
 WHERE conditions;
 */
 USE employees;
 
 COMMIT;
 
 DELETE FROM employees
 WHERE 
	emp_no = 499999;
    
    
    
/*
									DROP VS TRUNCATE VS DELETE
			DROP : 
				Remove all the structure of table and it's data from the DataBase.
                
			TRUNCATE:
				Remove the record from the table.
                Auto Increment key will autometically reset.
                
			DELETE:
				Remove the record when only a certain conditon is satisfied.
                If you don't use WHERE then TRUNCATE and DELETE both are same .Only Auto Increment key won't reset and Truncate is faster.
*/
    

SELECT 
    *
FROM
    employees
ORDER BY emp_no DESC;

ROLLBACK;
