CREATE DATABASE IF NOT EXISTS Sales;

/*
IF NOT EXISTS ens ure that Sales is not exist . If sales exist then it won't create a new database
# sql is not case sensetive so Sales / sales / 'SALES' all are same
SCHEMAS / DATABASE both are same . we can use :create schemas if not exists Sales;
*/

USE Sales;

CREATE TABLE sales
(
    purchase_number INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    date_of_purchase DATE NOT NULL,
    customer_id INT,
    item_code VARCHAR(10) NOT NULL
);

CREATE TABLE Customers 
(
    customer_id INT NOT NULL PRIMARY KEY,
    customer_name VARCHAR(15) NOT NULL,
    mail VARCHAR(20),
    phone_number INT,
    number_of_complaints INT NOT NULL
);

drop table sales.customers; # deleting cuatomer table


CREATE TABLE CUSTOMERS 
(
    customer_id INT NOT NULL,
    customer_name VARCHAR(255) NOT NULL,
    mail VARCHAR(255),
    phone_number INT,
    number_of_complain INT NOT NULL,
PRIMARY KEY (customer_id)
);

CREATE TABLE items
(
    item_code VARCHAR(255),
    unit_price NUMERIC(10 , 2 ),
    company_id VARCHAR(255),
PRIMARY KEY (item_Code)
);

CREATE TABLE companies (
    company_id VARCHAR(255),
    company_name VARCHAR(255),
    headquarters_phone_number INTEGER,
PRIMARY KEY (company_id)
);

# FOREIGN KEY
# alter use for making changes in the table . 
ALTER TABLE sales -- make a realtion between FK and PK
	ADD FOREIGN KEY (customer_id) REFERENCES customers(customer_id) ON DELETE CASCADE,
	ADD FOREIGN KEY (item_code) REFERENCES items(item_code) ON DELETE CASCADE;

ALTER TABLE items # making a relation between FK and PK 
	ADD FOREIGN KEY (company_id) REFERENCES companies(company_id) ON DELETE CASCADE;

# UNIQUE KEY
ALTER TABLE customers # making mail column from customers as unique key 
	ADD UNIQUE KEY (mail);

ALTER TABLE customers # for removing unique column from the table have to use index insted of DROP UNIQUE mail
	DROP INDEX mail;

# DEFAULT
ALTER TABLE customers # changeing column name and setting a default value 
	CHANGE COLUMN number_of_complain number_of_complains INT NULL DEFAULT 0,
	ALTER COLUMN number_of_complains DROP DEFAULT; # drop default feature from the column


ALTER TABLE companies
	ADD UNIQUE KEY (headquarters_phone_number) ,
	CHANGE COLUMN company_name company_name VARCHAR(255) DEFAULT 'X';


# NOT NULL
ALTER TABLE companies # Method 1
	MODIFY company_name VARCHAR(255) NOT NULL;

ALTER TABLE companies # Method 2
	CHANGE COLUMN company_name company_name VARCHAR(255) NOT NULL; 




INSERT INTO customers (customer_id , customer_name , mail , phone_number) # insert info into customer table into the mentioned columns . if you want to insert value to the all column then dont have mention any column
	VALUES(16,'Sobuj','sobuj@gmail.com',01789898989);

SELECT * FROM sales.customers; # print the customers table

