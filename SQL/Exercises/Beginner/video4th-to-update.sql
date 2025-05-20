/* --------------------------------- BEGINNER --------------------------------- */


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

# LIKE STATEMENT
-- % and _ (underscore)

-- this query would be finding someone whose 'first_name' starts with 'Jer' and then after that it could be anything
SELECT * 
FROM Parks_and_Recreation.employee_demographics
WHERE first_name LIKE 'Jer%'
;

-- Any employee whose name starts with 'a'
-- something to note here is that this is not Case-Sensitive
SELECT * 
FROM Parks_and_Recreation.employee_demographics
WHERE first_name LIKE 'a%'
;

-- Using underscore
/* this query would look for 'first_name' where the 
	first letter is 'a' and then after that there are only 2 characters */
SELECT * 
FROM Parks_and_Recreation.employee_demographics
WHERE first_name LIKE 'a__'
;

SELECT * 
FROM Parks_and_Recreation.employee_demographics
WHERE first_name LIKE 'a___'
;

SELECT * 
FROM Parks_and_Recreation.employee_demographics
WHERE first_name LIKE 'a___%'
;


-- GROUP BY & ORDER BY

/* -> question : average ages for gender
 -> the SELECT column and GROUP BY column MUST MATCH IF no aggregate function is used
	, otherwise they can be mis-matched or plural columns in SELECT
-> we can group on multiple columns
-> the order in which we put columns in ORDER BY is important to make sense and actually get real output
*/

-- GROUP BY
SELECT gender, AVG(age) AS "Average Age", 
	MAX(age) AS "Maximum Age", 
    MIN(age) as "Minimum Age",
    COUNT(age) as "Number of People in this category"
FROM Parks_and_Recreation.employee_demographics
GROUP BY gender
;

-- to see full salary table
SELECT *
FROM Parks_and_Recreation.employee_salary
;

SELECT occupation
FROM Parks_and_Recreation.employee_salary
GROUP BY occupation
;


SELECT occupation, salary
FROM Parks_and_Recreation.employee_salary
GROUP BY occupation, salary
;

-- ORDER BY

SELECT * 
FROM Parks_and_Recreation.employee_demographics
ORDER by gender
;

SELECT * 
FROM Parks_and_Recreation.employee_demographics
ORDER by gender ASC, age DESC
;

SELECT * 
FROM Parks_and_Recreation.employee_demographics
ORDER by gender, age
;
-- the above query is okay and works fine. It orders it first on gender, Female and Male, then it orders the age

SELECT * 
FROM Parks_and_Recreation.employee_demographics
ORDER by age, gender
;
/* but in the above query we can see the problem that it is ordered for age first but then after that,
	there are no unique values in the gender section to order from.
    Example:- after ordering of age, if there were multiple gender with the same age, let's say 40, then
    those would be ordered in the gender column for the same age 40 (just like Females being the common gender
    in the first ordering and then getting ordered on age within Female in our original correct query)
*/ 



-- HAVING vs WHERE

-- when doing things like below
SELECT gender, AVG(age)
FROM employee_demographics
WHERE AVG(age) > 40 -- here we know that this would give us Male gender in output
GROUP BY gender
;

/*
What we are trying to do above is that we want to see which gender (after grouping) and then calculating average age
has the average age above 40, and then display it in our output. 
The error arises for this query because data is first GROUPED and then what is in SELECT is calculated.
Because of this, the WHERE clause throws an error because we are trying to filter out something that hasn't 
been created yet.
*/

-- To combat this specific thing, HAVING was introduced

SELECT gender, AVG(age) as 'Average Age'
FROM employee_demographics
GROUP BY gender
HAVING AVG(age) > 40
;

/*
this puts our filtering condition after GROUP BY so that when grouping happens, and then
SELECT statements columns are calculated, then they are filtered out
*/

-- USING BOTH WHERE and HAVING

SELECT * 
FROM employee_salary
;

SELECT occupation, AVG(salary) AS "Average Salary"
FROM employee_salary
WHERE occupation LIKE '%manager%'
GROUP BY occupation
HAVING AVG(salary) > 75000
;


-- LIMIT and Aliasing

/*
- LIMIT -> To specify how many rows we want in our output
- limit can be combined with order by to be more powerful
- LIMIT 2 would mean display 2 rows but LIMIT 2, 1 would mean after that 2nd row, display the next row
- this means LIMIT *x*, *y* means after *x* row(s), display the next *y* row(s).
- the same can be written as LIMIT *x* OFFSET *y*
*/

SELECT *
FROM employee_demographics
LIMIT 4
;

SELECT *
FROM employee_demographics
ORDER BY age DESC
LIMIT 4
;

SELECT *
FROM employee_demographics
ORDER BY age DESC
LIMIT 4, 2
;

SELECT *
FROM employee_demographics
ORDER BY age DESC
LIMIT 4 OFFSET 2 -- show 4 rows starting 3rd row (OFFSET 2)
;


-- ALIASING
-- change the name of the column for the most part

/*
Two things to notice here:
1. aliases can be set by saying  AVG(salary) AS "Average Salary"
2. or it can be done like this AVG(salary) AS Average_Salary

The only difference to this is that we have to define it as text when we have space, that's why we used quotes.
BUT if we want to use an alias after like in HAVING and don't want to type the aggregate again and again, 
it is better to have a name which doesn't have any spaces, hence doesn't has to be defined in quotes, which 
then can be used an as alias anywhere
*/

-- wrong queries

SELECT occupation, AVG(salary) AS "Average Salary"
FROM employee_salary
WHERE occupation LIKE '%manager%'
GROUP BY occupation
HAVING "Average Salary" > 75000
;

SELECT occupation, AVG(salary) AS "Average Salary"
FROM employee_salary
WHERE occupation LIKE '%manager%'
GROUP BY occupation
HAVING Average Salary > 75000 -- there is gonna be showing red cross error here but that is what we want
;

-- correct query
SELECT occupation, AVG(salary) AS Average_Salary
FROM employee_salary
WHERE occupation LIKE '%manager%'
GROUP BY occupation
HAVING Average_Salary > 75000
;

/* --------------------------------- INTERMEDIATE --------------------------------- */


-- JOINS

-- INNER JOIN
-- Return the rows that are the same in both columns from both tables
-- by default 'JOIN' means INNER JOIN, but we can write both JOIN and INNER JOIN, it would mean the same


SELECT * 
FROM employee_demographics
;


SELECT * 
FROM employee_salary
;

SELECT * 
FROM employee_demographics
INNER JOIN employee_salary
	ON employee_demographics.employee_id = employee_salary.employee_id -- here I am specifying
;

-- OUTER JOINS

-- LEFT JOIN 
SELECT ED.employee_id, ED.first_name, ED.last_name, age, gender, occupation, salary 
FROM employee_demographics AS ED
LEFT JOIN employee_salary AS ES
	ON ED.employee_id = ES.employee_id
;


-- RIGHT JOIN 
SELECT ES.employee_id, ES.first_name, ES.last_name, age, gender, occupation, salary 
FROM employee_demographics AS ED
RIGHT JOIN employee_salary AS ES
	ON ED.employee_id = ES.employee_id
;


-- SELF JOIN
SELECT *
FROM employee_salary AS ED1
JOIN employee_demographics AS ED2 
	ON ED1.employee_id = ED2.employee_id
;


-- Joining Multiple Tables Together

SELECT ED.employee_id AS "Employee ID", ED.first_name AS "First Name", ED.last_name AS "Last Name", salary, dept_id as "Department ID", department_name as "Department Name"
FROM employee_demographics AS ED
INNER JOIN employee_salary AS ES
	ON ED.employee_id = ES.employee_id
INNER JOIN parks_departments as PD
	ON ES.dept_id = PD.department_id
;


-- UNIONS

SELECT first_name, last_name, 'Old Man' AS Label
FROM employee_demographics
WHERE age > 40 AND gender = 'Male'
UNION
SELECT first_name, last_name, 'Old Lady' AS Label
FROM employee_demographics
WHERE age > 40 AND gender = 'Female'
UNION
SELECT first_name, last_name, 'Highly Paid Employee' AS Label
FROM employee_salary
WHERE salary > 70000
ORDER BY first_name, last_name
;


-- _______________ STRINGS ________________

-- this basically means working with strings and how can we manipulate them and what kind of functions we can use with them

-- LENGTH
SELECT first_name, LENGTH(first_name) AS 'Length of First Name'
FROM employee_demographics
;

-- TRIM

-- common basic example
SELECT ('        hello          ');

-- full TRIM
SELECT TRIM('        hello          ');

-- LEFT TRIM
SELECT LTRIM('        hello          ');

-- RIGHT TRIM
SELECT RTRIM('        hello          ');

-- comment about TRIM
/* 
it is a bit hard to see this example in these lines but it is remove white spaces from the designated positions and
it should be quite handy when for example filling forms, a lot of people write the information and then sometimes add white spaces.
This would be good to trim all of that from the leading and/or trailing parts to only get the information that is necessary
*/

-- SUBSTRINGS (seems very important this one)

-- this could be better understood by first looking at LEFT and RIGHT

-- LEFT
SELECT first_name, LEFT(first_name, 4) AS 'first 4 charaacters'
FROM employee_demographics;

-- RIGHT
SELECT first_name, 
		LEFT(first_name, 4) AS 'first 4 charaacters',
        last_name,
        RIGHT(last_name, 3) AS 'last 4 characters'
FROM employee_demographics;


-- SUBSTRING
SELECT first_name,
		LEFT(first_name, 4),
		RIGHT(first_name, 4),
		SUBSTRING(first_name, 3,2)
FROM employee_demographics;

-- example to know what birth month everyone is born in using substring
/*
	if we see the date format in the data it is like this '1994-05-24', 
    which means we should start at character 6, and extract 2 characters
*/

SELECT first_name, last_name,
SUBSTRING(birth_date, 6,2) AS 'Birth Month'
FROM employee_demographics;

-- REPLACE

SELECT first_name, REPLACE(first_name, 'a', 'z')
FROM employee_demographics
;

-- LOCATE
SELECT first_name, LOCATE('An', first_name)
FROM employee_demographics
;

-- CONCAT

SELECT first_name, 
		last_name, 
        CONCAT(first_name, ' ', last_name)
FROM employee_demographics
;


-- ______________________ CASE STATEMENTS ______________________

/*
**Problem statement**: Council sent out a memo for pay increase, gotta follow it and determine people's new end of year salary and if they got a bonus, how much was it.
Pay Increase and Bonus:
- < 50000 = 5%
- > 50000 = 7%
- Finance department = 10% bonus
*/

SELECT first_name, last_name, salary,
CASE
	WHEN salary < 50000 THEN salary * 1.05
    WHEN salary > 50000 THEN salary * 1.07
END AS 'New_Raised_Salary',
CASE
	WHEN dept_id = 6 THEN salary * 0.10
END AS 'Bonus'
FROM employee_salary
;


-- if we want to label rather than calculate

SELECT first_name,
		last_name,
		age,
CASE
	WHEN age <= 30 THEN 'Young'
	WHEN age BETWEEN 31 and 50 THEN 'Old'
	WHEN age >= 50 THEN "On Death's Door"
END AS Age_Bracket
FROM employee_demographics;

-- ____________________ SUBQUERIES ___________________

-- using subquery in WHERE clause
SELECT * 
FROM employee_demographics
WHERE employee_id IN
					(
                    SELECT employee_id 
                    FROM employee_salary
                    WHERE dept_id IN
									(
                                    SELECT department_id 
                                    FROM parks_departments
                                    WHERE department_name = 'Parks and Recreation'
                                    )
					)
;


-- using subquery in SELECT clause

SELECT first_name, 
		salary,
		(SELECT AVG(salary)
			FROM employee_salary)
FROM employee_salary
;


-- _____________________WINDOW FUNCTIONS__________________

-- Problem Statement: We want to take gender column in our demographics table and compare it to salaries which is in salaries table.

-- GROUP BY approach
SELECT gender, AVG(salary) AS Average_Salary
FROM employee_demographics AS ED
JOIN employee_salary AS ES
	ON ED.employee_id = ES.employee_id
GROUP BY gender
;

-- WINDOW Approacoh
SELECT ED.first_name, ED.last_name, ED.gender, ES.salary, AVG(ES.salary) OVER(PARTITION BY gender) AS Average_Gender_Salary
FROM employee_demographics AS ED
JOIN employee_salary AS ES
	ON ED.employee_id = ES.employee_id
;


-- example of using OVER()
SELECT ED.first_name, ED.last_name, ED.gender, ES.salary, AVG(ES.salary) OVER()
FROM employee_demographics AS ED
JOIN employee_salary AS ES
	ON ED.employee_id = ES.employee_id
;

-- example of using ROLLING TOTAL
SELECT ED.first_name, ED.last_name, ED.gender, ES.salary, SUM(ES.salary) OVER(PARTITION BY gender ORDER BY ED.employee_id) AS Rolling_Gender_Sum_Salary
FROM employee_demographics AS ED
JOIN employee_salary AS ES
	ON ED.employee_id = ES.employee_id
;

-- ROW NUMBER
SELECT ED.employee_id,ED.first_name, ED.last_name, gender, ES.salary,
ROW_NUMBER() OVER()
FROM employee_demographics AS ED
JOIN employee_salary AS ES
ON ED.employee_id = ES.employee_id
;

-- ROW NUMBER BUT GIVING UNIQUE ROW NUMBER IN EACH GENDER
SELECT ED.employee_id,ED.first_name, ED.last_name, gender, ES.salary,
ROW_NUMBER() OVER(PARTITION BY gender) as row_num
FROM employee_demographics AS ED
JOIN employee_salary AS ES
ON ED.employee_id = ES.employee_id
;

-- same as above but ordering by salary within each partition
SELECT ED.employee_id,ED.first_name, ED.last_name, gender, ES.salary,
ROW_NUMBER() OVER(PARTITION BY gender ORDER BY ES.salary DESC) as row_num
FROM employee_demographics AS ED
JOIN employee_salary AS ES
ON ED.employee_id = ES.employee_id
;

-- RANK Function
SELECT ED.employee_id,ED.first_name, ED.last_name, gender, ES.salary,
ROW_NUMBER() OVER(PARTITION BY gender ORDER BY ES.salary DESC) as row_num,
RANK() OVER(PARTITION BY gender ORDER BY ES.salary DESC) as rank_num 
FROM employee_demographics AS ED
JOIN employee_salary AS ES
ON ED.employee_id = ES.employee_id
;

-- DENSE RANK FUNCTION
SELECT ED.employee_id,ED.first_name, ED.last_name, gender, ES.salary,
ROW_NUMBER() OVER(PARTITION BY gender ORDER BY ES.salary DESC) as row_num,
RANK() OVER(PARTITION BY gender ORDER BY ES.salary DESC) as rank_num,
DENSE_RANK() OVER(PARTITION BY gender ORDER BY ES.salary DESC) as dense_rank_num
FROM employee_demographics AS ED
JOIN employee_salary AS ES
ON ED.employee_id = ES.employee_id
;

/* ------------------------- ADVANCED ------------------------- */


-- _________________CTEs_____________________
WITH CTE_Example AS
(
	SELECT gender, AVG(salary) AS avg_sal, MAX(salary) AS max_sal, MIN(salary) AS min_sal, COUNT(salary) AS count_sal
	FROM employee_demographics AS ED
	JOIN employee_salary AS ES
	ON ED.employee_id = ES.employee_id
	GROUP BY gender
)
SELECT AVG(avg_sal)
FROM CTE_Example
;

-- Example to show we can have multiple CTEs and then use it, even for joining purposes and stuff

WITH CTE_Example AS
(
	SELECT employee_id, gender, birth_date
	FROM employee_demographics
	WHERE birth_date > '1985-01-01'
),
CTE_Example2 AS
(
	SELECT employee_id, salary
	FROM employee_salary
	WHERE salary > 50000
)
SELECT *
FROM CTE_Example
JOIN CTE_Example2
ON CTE_Example.employee_id = CTE_Example2.employee_id
;


-- _____________ TEMP TABLES _____________

-- normal creation
CREATE TEMPORARY TABLE temp_table 
( 
column_1 varchar(20),
column_2 varchar(20),
column_3 varchar(20)
);

SELECT * FROM temp_table;



-- duplicating or creating one like an already existing table
CREATE TEMPORARY TABLE dup_ED LIKE employee_demographics
;

SELECT * FROM dup_ED;

-- creating one using a condition
CREATE TEMPORARY TABLE salary_over_50k
SELECT *
FROM employee_salary
WHERE salary >= 50000
;

SELECT * FROM salary_over_50k;

-- dropping temp tables
DROP TEMPORARY TABLE IF EXISTS salary_over_50k;
DROP TEMPORARY TABLE IF EXISTS temp_table;
DROP TEMPORARY TABLE IF EXISTS dup_ED;


-- _______________________ STORED PROCEDURES _______________________

-- creation
CREATE PROCEDURE salary_above_50k()
SELECT * 
FROM employee_salary
WHERE salary >= 50000
;

-- calling a stored procedure
CALL salary_above_50k();
-- making a stored procedure with actual good practices and correct way

-- mentioning the database

-- dropping the procedure if it already exists

-- Change the DELIMITER in order to save mulitple queries inside a procedure
DELIMITER $$ 

USE Parks_and_Recreation$$

CREATE PROCEDURE salary_above_10k_50k()
BEGIN
	SELECT *
	FROM employee_salary
	WHERE salary >= 50000;
	SELECT *
	FROM employee_salary
	WHERE salary >= 10000;
END$$

DELIMITER ;


CALL salary_above_10k_50k();
