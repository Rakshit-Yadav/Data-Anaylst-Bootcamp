##### Rough Bullet points

- Common use case :- as a data analyst, restoring intermediate results of complex queries like a CTE but also for using to manipulate data before inserting it into a more permanent table

- keep the naming something like I want to remember what I am saving in the temp table so it can be then used easily
- Temp tables last till our server session goes on (meaning till we are connected)
- Now for CTE and Temp tables, the most common thing to use Temp tables would be we can use them wherever while we are connected in the session. 
- They are bit more advanced as compared to CTEs and have much more use cases with Stored Procedures.

##### Ways to create Temp Tables

- *Normal creation using create command*
	```SQL
	CREATE TEMPORARY TABLE temp_table ( column_1 varchar(20),
	column_2 varchar(20),
	column_3 varchar(20))
	;
	```
	![](attachments/Pasted%20image%2020250517174935.png)

- *Duplicating a already existing Table in database, by duplication it means the column names, the structure of the table, NOT the values*
	```SQL
	CREATE TEMPORARY TABLE dup_ED LIKE employee_demographics
	;
	```
	
	![](attachments/Pasted%20image%2020250517175131.png)

- *Creating using a condition on an existing table, basically acting like a filter*
	
	```SQL
	CREATE TEMPORARY TABLE salary_over_50k
	SELECT *
	FROM employee_salary
	WHERE salary >= 50000
	;
	```
	
	![](attachments/Pasted%20image%2020250517175612.png)
	

##### Dropping a TEMP TABLE

```SQL
DROP TEMPORARY TABLE IF EXISTS [TABLE_NAME]
;
```

