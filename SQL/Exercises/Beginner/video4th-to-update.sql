SELECT * 
FROM  Parks_and_Recreation.employee_demographics;

SELECT * 
FROM employee_salary;

/* we can also specify the names we want to get and display from table rather than all of them */
SELECT  first_name,
	last_name,
	gender
FROM Parks_and_Recreation.employee_demographics;
/* here something can be seen that I have put names and baiscally dismantled the query into mulitple lines,
this is much much better for readability and interpretability, good practise to make from the starting. */

SELECT  first_name,
	last_name,
	gender,
    age,
    age + 10
FROM Parks_and_Recreation.employee_demographics;
/* We can also add extra display columns with simple calculations */

# the below example shows how PEMDAS operates in SQL
SELECT  first_name,
	last_name,
	gender,
    age,
    (age + 10)*10 AS 'PEMDAS Example'
FROM Parks_and_Recreation.employee_demographics;


SELECT DISTINCT 
first_name, 
gender
FROM Parks_and_Recreation.employee_demographics;


## WHERE CLAUSE

SELECT * 
FROM Parks_and_Recreation.employee_salary
WHERE first_name = "Leslie"
;
/* here the '=' operator is called a comparsion operator using with WHERE clause */

# examples
SELECT * 
FROM Parks_and_Recreation.employee_salary
WHERE salary < 50000
;

SELECT * 
FROM Parks_and_Recreation.employee_salary
WHERE salary > 50000
;

SELECT * 
FROM Parks_and_Recreation.employee_salary
WHERE salary >= 50000
;

SELECT * 
FROM Parks_and_Recreation.employee_demographics
WHERE gender != 'Female';

SELECT * 
FROM Parks_and_Recreation.employee_demographics
WHERE birth_date > '1987-01-01'
;

# Logical Operator 

# AND
SELECT * 
FROM Parks_and_Recreation.employee_demographics
WHERE birth_date > '1987-01-01'
AND gender = 'Male'
;

# OR
SELECT * 
FROM Parks_and_Recreation.employee_demographics
WHERE birth_date > '1987-01-01'
OR gender = 'Male'
;

# NOT
SELECT * 
FROM Parks_and_Recreation.employee_demographics
WHERE birth_date > '1987-01-01'
AND NOT gender = 'Male'
;

# PEMDAS in Logical operator
SELECT * 
FROM Parks_and_Recreation.employee_demographics
WHERE (first_name = 'Leslie' AND age = 44) OR age > 55
;

SELECT * 
FROM Parks_and_Recreation.employee_demographics
WHERE first_name LIKE 'Jer'
;
