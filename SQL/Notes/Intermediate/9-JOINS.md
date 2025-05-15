### INNER JOINS

- ```JOIN``` by default means ```INNER JOIN```
- INNER JOIN → Return the rows that are the same in both columns from both tables.

sample query of how it works
```SQL
SELECT * /* or whatever you want to display */
FROM /* FIRST TABLE */
INNER JOIN /* SECOND TABLE */
	ON /*FIRST TABLE.COLUMN*/ = /*SECOND TABLE.COLUMN*/
;
```

> Problem Statement
> 	Show everything from both demographics and salary table for all the employees

This means we want to show everything and we can join both tables on the common thing in both of them, ```employee_id```

```SQL
SELECT *
FROM employee_demographics AS ED
INNER JOIN employee_salary AS ES
	ON ED.employee_id = ES.employee_id
;
```

- Here a point has to be noted that in order to not have *ambiguity* because of the same column name in both tables, we have to specify the column name using ```Table_name.Column_name```, so that we don't get any error, and this is a good practise in general as well.

OUTPUT:
![](attachments/Pasted%20image%2020250414145758.png)
Here, we can see that employee id number 2 is not here, It was Ron in employee_salary table but not in employee_demographics table, which is why when inner joined, that employee was not displayed in the output.

### OUTER JOINS
This comprises of LEFT and RIGHT JOINS
#### LEFT JOIN / LEFT OUTER JOIN

- Both can be used regardless, they both are similar.
- Definition → It will take everything from the LEFT table and only take the matching rows from the RIGHT table

OUTPUT for the same problem statement above but using LEFT JOIN:
![](attachments/Pasted%20image%2020250414150750.png)
Here it can be seen that the output is still the same (except that I am printing specific columns now). This is the case because the employee_id 2 was not present in demographics table (LEFT table), which lead to it still not being present in the output.

#### RIGHT JOIN / RIGHT OUTER JOIN

- Both can be used regardless, they both are similar.
- Definition → It will take everything from the RIGHT table and only take the matching rows from the LEFT table

OUTPUT:
![](attachments/Pasted%20image%2020250414151053.png)
Here we can see that we are able to see 'Ron' in the output because his data is present in the RIGHT table and we are using RIGHT JOIN. 

> *IMPORTANT POINT* → something to note here is that to display correct output with information, aliases for ambiguous columns  should be handled correctly. I changed the alias from **ED** to **ES**  for first 3 columns so that that information can be displayed, otherwise it would be ```NULL``` there, just like age and gender because that information for Ron does not exist. So important point to keep in mind.


### SELF JOIN

This is to Join a table to itself.

![](attachments/Pasted%20image%2020250414152943.png)
As can be seen from the image, it is just joining the table onto itself based on any column which we can use because as it is the same table, we can practically join on any column.


Now, use cases of this can , I think, be defined like this:

> It's basically used where there is any relationship between rows stored in the same table.

So some examples of it could be :
- Secret santa in the office ( as discussed in video)
- Employee - Manager (bcz manager is also an employee and is in the same table)
- Employee - Supervisor (kinda the same thing)


### Joining Multiple Tables Together

- *Use Case*: When we have multiple tables, like in our example 3 tables, ```employee_demograhpics```, ```employee_salary```, ```parks_departments```. Now the 1st and 3rd table do not have anything in common to tie to, but we can use basically transitive property, and connect both of those tables using the 2nd table.
- salary table has department id, which is in parks department table, and then if we want to have the department name being shown with the information of employee demograhpics, then we can do that by joining multiple tables in one command.

```SQL
SELECT *
FROM employee_demographics AS ED
INNER JOIN employee_salary AS ES
	ON ED.employee_id = ES.employee_id
INNER JOIN parks_departments as PD
	ON ES.dept_id = PD.department_id
;
```

- This yields the Result :-
	![](attachments/Pasted%20image%2020250502195136.png)


