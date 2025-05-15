#### GROUP BY

- we can group the data based on Column(s). 

![](attachments/Pasted%20image%2020250401133634.png)

- Some things to remember here
	- The column in the ```SELECT``` and ```GROUP BY``` have to match UNLESS we are using **aggregated columns** in our SELECT statement.
	- we can group for multiple columns

![](attachments/Pasted%20image%2020250401134742.png)
Here we can see different kind of aggregate functions we can use and show different kind of information for the age column when we group on gender column.

- Going to the other salary table in the database, when grouped by the occupation, there is only 1 office manager :

![](attachments/Pasted%20image%2020250401134421.png)

- But then when grouped on occupation and salary in this table, it changes to 2 :

![](attachments/Pasted%20image%2020250401134512.png)

Thing to note here is that if the salary were to be the same for these 2 Office Manager, then that would have also grouped, and we would have only seen 1 entry only.


#### ORDER BY

- SORTING the results in ASCENDING (**ASC**) (by *DEFAULT*) or DESCENDING (**DESC**)

![](attachments/Pasted%20image%2020250401135604.png)

- We can also use ASC and DESC for specific columns

![](attachments/Pasted%20image%2020250401140752.png)

- A very important thing for ORDER BY is the order in which we state the columns on which we want to order the results if we are ordering on multiple columns.

A example of this is as follows:

this query is okay and works fine. It orders it first on gender, Female and Male, then it orders the age
```SQL
SELECT * 
FROM employee_demographics
ORDER by gender, age
;
```

![](attachments/Pasted%20image%2020250401135755.png)

```sql
SELECT * 
FROM employee_demographics
ORDER by age, gender
;
```

![](attachments/Pasted%20image%2020250401135900.png)

But in the above query we can see the problem that it is ordered for age first but then after that, there are no unique values in the gender section to order from.

*Example*:- after ordering of age, if there were multiple gender with the same age, let's say 40, then those would be ordered in the gender column for the same age 40 (just like Females being the common gender in the first ordering and then getting ordered on age within Female in our original correct query)