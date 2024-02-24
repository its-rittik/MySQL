/*
																	Variable types
			1. Local variable
				Only use between BEGIN - END section.
                DECLARE keyword use for defining the variable
                
            2.Session variable 
				Session: A series of information exchange intercarions, or a dialogue , between a computer and a user
						 Session is the outcome of a successful MySql connection.
				Session Variable: A variable that exists only for the session in which you are operating
						- it is a defined on our server , and it lives there
                        - it is visible to the connection begin used only. That means if there are 100 used using the sarver that means there are 100 connection and 100 sessions
                          As a user I can only see my created variable on my session .
					    - SET keyword use for the creating a variable and @ before the variable name 
                          EX: SET @s_var1 = 3; In same root connection I can use this variable any SQL file I want.
                          
            3.Global variable
				Global variable apply to all connections related to a specific server.
                Two way of creating a global variable .
					1. SET GLOBAL var_name = value ;
                    2. SET @@global.var_name = value ;
				Only system variable can set as global variable .
				
*/
SET SESSION sql_mode = 'StRICT_TRANS_TABLES'; 
SET SESSION max_connection = 1000;

# Both are system variable . One can be set as session variable other can't