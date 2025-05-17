#### WINDOWS

- They are basically like GROUP BY but they don't roll the final answer into 1 row like it, they keep the data and the rows as is and adds the final answer in front of the rows
- They also enable calculations over certain rows, hence the name windows.

![](attachments/Pasted%20image%2020250517152439.png)

- A general syntax like above can be seen where rather than using group by and having restrictions of what we can display information, it has much more functionality.

##### Example of Windows compared to GROUP BY

> Problem Statement: We want to take gender column in our demographics table and compare it to salaries which is in salaries table.

###### GROUP BY Approach

```SQL
SELECT gender, AVG(salary) AS Average_Salary
FROM employee_demographics AS ED
JOIN employee_salary AS ES
	ON ED.employee_id = ES.employee_id
GROUP BY gender
;
```

OUTPUT:
![](attachments/Pasted%20image%2020250517152955.png)

But this just gives us a summarised output, what if we wanted to see this output in front of our rows present in our demographics table and compare each person's salary with their average gender's salary.

###### WINDOW Approach

```SQL
SELECT ED.first_name, ED.last_name, ED.gender, ES.salary, AVG(ES.salary) OVER(PARTITION BY gender) AS Average_Gender_Salary
FROM employee_demographics AS ED
JOIN employee_salary AS ES
	ON ED.employee_id = ES.employee_id
;
```

OUTPUT:
![](attachments/Pasted%20image%2020250517153407.png)

- Some things that I noted here:
	- There is much more flexibility on what we can SELECT and display and not having the bounds of only having things in select which we will have to then GROUP BY
	- We have much more autonomy on how we want to treat the aggregate/calculations we want to do.

- `OVER()` → This basically would calculate that average (in this case, basically any window function we select) on the whole of  that column
	- Example :  
	```SQL
	SELECT ED.first_name, ED.last_name, ED.gender, ES.salary, AVG(ES.salary) OVER()
	FROM employee_demographics AS ED
	JOIN employee_salary AS ES
	ON ED.employee_id = ES.employee_id
	;
	```

	OUTPUT: It is directly calculating the sum of the salary column and displaying it, that't it.
	![](attachments/Pasted%20image%2020250517154216.png)

- `PARTITION BY` → This basically partitions the data into different sets to apply said window function (i think basically this is GROUP BY but for mentioning inside OVER())

#### TYPES OF WINDOW FUNCTIONS

##### AGGREGATE FUNCTIONS

Common ones include:
- SUM(): Sums values within a window.
- AVG(): Calculates the average value within a window.
- COUNT(): Counts the rows within a window.
- MAX(): Returns the maximum value in the window.
- MIN(): Returns the minimum value in the window.

###### Example of Rolling Total

```SQL
SELECT ED.first_name, ED.last_name, ED.gender, ES.salary, SUM(ES.salary) OVER(PARTITION BY gender ORDER BY ED.employee_id) AS Rolling_Gender_Sum_Salary
FROM employee_demographics AS ED
JOIN employee_salary AS ES
	ON ED.employee_id = ES.employee_id
;
```

OUTPUT:
![](attachments/Pasted%20image%2020250517155046.png)


##### RANK FUNCTIONS

These are:
- RANK: Assigns ranks to rows, skipping ranks for duplicates.
- DENSE_RANK: Assigns ranks to rows without skipping rank numbers for duplicates.
- ROW_NUMBER: Assigns a unique number to each row in the result set.

###### ROW NUMBER

```SQL
SELECT ED.employee_id,ED.first_name, ED.last_name, gender, ES.salary,
ROW_NUMBER() OVER()
FROM employee_demographics AS ED
JOIN employee_salary AS ES
ON ED.employee_id = ES.employee_id
;
```

This will basically assign a unique row number to each row, that's about it.

OUTPUT:
![](attachments/Pasted%20image%2020250517155455.png)

This can also be used in conjunction with `PARTITON BY` to provide unique row numbers in each gender for example

```SQL
SELECT ED.employee_id,ED.first_name, ED.last_name, gender, ES.salary,
ROW_NUMBER() OVER(PARTITION BY gender) as row_num
FROM employee_demographics AS ED
JOIN employee_salary AS ES
ON ED.employee_id = ES.employee_id
;
```

OUTPUT:
![](attachments/Pasted%20image%2020250517155734.png)

Also, we can make this more useful to order the data by, for example, salary column which will then result in getting a row number (and kind of a ranking) in respective gender for each employee according to their salaries

```SQL
SELECT ED.employee_id,ED.first_name, ED.last_name, gender, ES.salary,
ROW_NUMBER() OVER(PARTITION BY gender ORDER BY ES.salary DESC) as row_num
FROM employee_demographics AS ED
JOIN employee_salary AS ES
ON ED.employee_id = ES.employee_id
;
```

OUTPUT:
![](attachments/Pasted%20image%2020250517155936.png)

###### RANK 

```SQL
SELECT ED.employee_id,ED.first_name, ED.last_name, gender, ES.salary,
ROW_NUMBER() OVER(PARTITION BY gender ORDER BY ES.salary DESC) as row_num,
RANK() OVER(PARTITION BY gender ORDER BY ES.salary DESC) as rank_num 
FROM employee_demographics AS ED
JOIN employee_salary AS ES
ON ED.employee_id = ES.employee_id
;
```

OUTPUT:
![](attachments/Pasted%20image%2020250517161525.png)

Thing to note here in the red box is the purpose of rank, it skips rank for duplicates.
**BUT**, for the next one, it ranks it positionally, *NOT NUMERICALLY*.

###### DENSE RANK

Only difference between RANK and DENSE RANK, it would be that the next rank after duplicates is now *GOING TO BE NUMERICALLY, **NOT** POSITIONALLY*.

```SQL
SELECT ED.employee_id,ED.first_name, ED.last_name, gender, ES.salary,
ROW_NUMBER() OVER(PARTITION BY gender ORDER BY ES.salary DESC) as row_num,
RANK() OVER(PARTITION BY gender ORDER BY ES.salary DESC) as rank_num,
DENSE_RANK() OVER(PARTITION BY gender ORDER BY ES.salary DESC) as dense_rank_num
FROM employee_demographics AS ED
JOIN employee_salary AS ES
ON ED.employee_id = ES.employee_id
;
```

OUTPUT:
![](attachments/Pasted%20image%2020250517161927.png)

