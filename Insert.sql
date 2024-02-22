/*
	INSERT INTO table_name (column_1 , column_2 ,.... column_n)
		VALUES (value_1 , value_2,...... value_n)
*/
USE employees;
INSERT INTO employees
(	
	emp_no,
    birth_date,
    first_name,
    last_name,
    gender,
    hire_date
) VALUES
(	
	 999903,
    '1999-08-01',
    'Rittik',
    'Das',
    'M',
    '2023-01-30'
);

INSERT INTO titles
(
	emp_no,
    from_date,
    title
) VALUES
(	
	999903,
    '2023-01-30',
    "Senior Engineer"
);

INSERT INTO departments
VALUES
(
	'd010',
    'Business Analysis'
);

SELECT 
    *
FROM
    titles
ORDER BY emp_no DESC
LIMIT 10;