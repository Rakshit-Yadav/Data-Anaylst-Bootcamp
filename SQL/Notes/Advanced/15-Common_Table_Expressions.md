- **Definition** → A **Common Table Expression (CTE)** in SQL is a temporary result set that is defined and used within the execution scope of a **SELECT, **INSERT, **UPDATE**, or **DELETE** statement. CTEs are defined using the WITH clause and can be referenced multiple times within the main SQL query. This makes CTEs a great alternative to **subqueries**, especially in cases where we need to perform the same operation multiple times or create **recursive queries**. ([GeeksForGeeks](https://www.geeksforgeeks.org/cte-in-sql/)) 

- You can only use them right after you create them

![](attachments/Pasted%20image%2020250517164929.png)

##### Example of using CTE in place of Subquery because it is much cleaner looking syntax and easier to understand visually

```SQL
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
```

OUTPUT:
![](attachments/Pasted%20image%2020250517165251.png)

The similar sub-query would look something like this:
![](attachments/Pasted%20image%2020250517165403.png)

Which is in fact not cleaner and a bit hard to understand syntax-wise, what is happening and where is it happening.

- CTEs also give us a away to name a full query  to then refer it afterwards easily, which is also nice
- We can do multiple CTEs because starting using them.

###### DUMB Example to show mulitple CTEs but I get the point

```SQL
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
```

OUTPUT:
![](attachments/Pasted%20image%2020250517170249.png)

- We can also name our column names with our CTE name as well, like you see below:
```SQL
WITH CTE_Example (Gender, AVG_Sal, MAX_Sal, MIN_Sal, COUNT_Sal) AS
(
	SELECT gender, AVG(salary) AS avg_sal, MAX(salary) AS max_sal, MIN(salary) AS min_sal, COUNT(salary) AS count_sal
	FROM employee_demographics dem
	JOIN employee_salary sal
	ON dem. employee_id = sal.employee_id
	GROUP BY gender
)
SELECT *
FROM CTE_Example
;
```

The defined column names outside will  ALWAYS prevail.

#### Recursive CTEs ([GeeksForGeeks](https://www.geeksforgeeks.org/cte-in-sql/#:~:text=recursive%20common%20table%20expression%20))

- A recursive CTE is one that references itself within that CTE. The recursive **CTE** is useful when working with hierarchical data as the CTE continues to execute until the query returns the entire hierarchy. A typical example of hierarchical data is a table that includes a list of **employees**. For every employee, the table provides a reference to that person’s manager.
![](attachments/Pasted%20image%2020250517170729.png)

- With Recursion, there also has to be a limit to it so that it doesn't run in an infinite loop and possibly crash the server. By Default, 100 is limit,  but it can be set using `MAXCURSION` (`OPTION(MAXRECURSION 50)`).

![](attachments/Pasted%20image%2020250517170946.png)
