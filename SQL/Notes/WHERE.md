#### WHERE Clause

* Where clause is used to basically filter what we want to select. 
* It introduces a condition to our query which has to be fulfilled and then the entries which do, are the output.
* Example → ![](attachments/Pasted%20image%2020250325141704.png)
	As the table only had one employee named "Leslie", that is the only one that shows in the output.

##### Comparison Operators

```sql
	SELECT * 
	FROM [Database].[Table]
	WHERE first_name = "Leslie"
	;
```
In this query, the ``` = ```  operation used is called a **Comparison Operator**. There are multiple types of it which we can use.

```sql
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
```

* *Comparison operator* examples →
	![](attachments/Pasted%20image%2020250325142339.png)
	![](attachments/Pasted%20image%2020250325142451.png)
	![](attachments/Pasted%20image%2020250325142517.png)
	![](attachments/Pasted%20image%2020250325143349.png)
	![](attachments/Pasted%20image%2020250325143948.png)

##### Logical Operators
* **AND** → Both given conditions have to be met 
- **OR** → Either one condition has to be met
* **NOT** → Not the thing which we specify


![](attachments/Pasted%20image%2020250325151343.png)

![](attachments/Pasted%20image%2020250325151327.png)

![](attachments/Pasted%20image%2020250325152843.png)

* PEMDAS in WHERE clause with Operators
	* ![](attachments/Pasted%20image%2020250325153051.png)
	* Here we can see that when the condition inside the parentheses will be met, and then what is outside will be taken.

##### LIKE STATEMENT

- when we are using comparison operators using arithmetic operators or logical operators, we are looking for something which is EXACTLY that.
- but when we are trying to look for something that is "like" something, then we can use this operator.
	- There are 2 kind of operators which can be used with *LIKE*
		- % (percentage) → this means anything
		- _ (underscore) → This means a specific value

Use of **LIKE**, with the given operators:
```sql
SELECT *
FROM employee_demographics
WHERE first_name LIKE 'Jer%'
;
```

The above query would mean look at ```first_name``` and it should start with 'Jer' but then it can be anything after that.

![](attachments/Pasted%20image%2020250328171603.png)


