
- query within a query

##### Example of using in WHERE Clause

- Selecting employees who worked in the actual Parks and Recreation Department (*dept id 1 for my reference i am writing here*)

```SQL
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
```

OUTPUT: ![](attachments/Pasted%20image%2020250515183306.png)

##### Example of using in SELECT Clause

- Showing the average salary with the employee salary 

```SQL
SELECT first_name, 
		salary,
		(SELECT AVG(salary)
			FROM employee_salary)
FROM employee_salary
;
```

OUTPUT:
![](attachments/Pasted%20image%2020250515183744.png)

##### Example of use in FROM clause

![](attachments/Pasted%20image%2020250515183913.png)

- use of backticks around MAX(age) is so that it then treats it as a column rather than a function.
- This can also be done simply by naming all the columns

![](attachments/Pasted%20image%2020250515184147.png)

![](attachments/Pasted%20image%2020250515185220.png)

- I don't really see any benefit in the last example as it calculating average of a single number but I get the idea what we can do with this.