- It is a way to save our SQL code so we can reuse it again and again without writing it again and again

#### Creation
To make a stored procedure:
```SQL
CREATE PROCEDURE name_of_stored_procedure()
[query we want to save]
;
```
Example :- Storing a query to show people with salaries above 50000 in our database
```SQL
CREATE PROCEDURE salary_above_50k()
SELECT * 
FROM employee_salary
WHERE salary >= 50000
;
```
#### Calling  a Stored Procedure

```SQL
CALL name_of_stored_procedure();
```

#### How to make the Stored Procedure with Good Practices

```SQL
-- mentioning the database
USE Parks_and_Recreation;
-- dropping the procedure if it already exists
DROP PROCEDURE IF EXISTS salary_above_10k_50k;
-- Change the DELIMITER in order to save mulitple queries inside a procedure
DELIMITER $$ -- just a widely used choice to use $$
CREATE PROCEDURE salary_above_10k_50k()
BEGIN
	SELECT *
	FROM employee_salary
	WHERE salary >= 50000;
	SELECT *
	FROM employee_salary
	WHERE salary >= 10000;
END $$
-- change the DELIMITER back (very important)
DELIMITER ;
```
OUTPUT:
![](attachments/Pasted%20image%2020250517185350.png)

It gives back the output in 2 tables, as we called 2 statements

- **BIG NOTE** → Something I noticed while running this is, can't have comments in between running code, otherwise it just doesn't execute, may have to confirm this somehow.

##### WHY STORED PROCEDURES 

![](attachments/Pasted%20image%2020250517185509.png)
