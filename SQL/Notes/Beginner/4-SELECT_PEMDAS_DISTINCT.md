#### SELECT, FROM, Database names, Table names
- good practise to add ```[database_name].[table_name]```, normally it's not needed for simpler or small tasks but when working with multiple databases, a good practise to follow

- we can select either all the columns (using "star"we can also name what columns we do want to have there. ![](attachments/Pasted%20image%2020250325124439.png)

- we can not only select columns, but also do more with it.
	- For example, the age column, it is a number column, hence we can display more column using that as follows:![](attachments/Pasted%20image%2020250324164452.png)Here we can see that we can do normal "age+10" or simple arithmetic to add this as a column and display it.

- How to comment? 2 ways:
	- use of ```#``` to make single line comments.
	- use ```/* comment here */``` to have multiple line comments.
#### PEMDAS
order of operation of math within SQL
**P**arantheses, **E**xponent, **M**ultiplication, **D**ivision, **A**ddition, **S**ubtraction

![](attachments/Pasted%20image%2020250325134804.png)

Here above, it can be seen that first parentheses is solved, and then multiplication comes.

#### DISTINCT

For the ```employee_demographics``` table, there is a column ```gender```.

For columns where we know there are repeating entries and we want to see what *distinct* entries are there, we can use ```DISTINCT```

```sql 
SELECT DISTINCT [Column_name]
FROM [Database].[Table_name];
```

* Before
	![](attachments/Pasted%20image%2020250325140230.png)

- After
	![](attachments/Pasted%20image%2020250325140320.png)

- But something to keep in mind that this wouldn't work when the column(s) we have selected does not have entries like this. 
	For example: if we took both first_name and gender, then → ![](attachments/Pasted%20image%2020250325140612.png)
	this won't work because here ```first_name``` column all has distinct values, hence, for gender it is not grouped into 2 categories, Male and Female.












