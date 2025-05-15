**Problem Statement**:
What we are trying to do is that we want to see which gender (after grouping) and then calculating average age has the average age above 40, and then display it in our output. 

```sql
SELECT gender, AVG(age)
FROM employee_demographics
WHERE AVG(age) > 40 -- here we know that this would give us Male gender in output
GROUP BY gender
;
```

![](attachments/Pasted%20image%2020250401141807.png)

The error arises for this query because data is first GROUPED and then what is in SELECT is calculated. Because of this, the WHERE clause throws an error because we are trying to filter out something that hasn't been created yet.

- For FILTERING Aggregated functions, we can use ```HAVING``` 

![](attachments/Pasted%20image%2020250401142013.png)

This puts our filtering condition after GROUP BY so that when grouping happens, and then
SELECT statements columns are calculated, then they are filtered out.

Now we can do more things, where we are using both WHERE and HAVING

**Problem Statement**:
In the employee salary table, we want to see if any *kind of manager* positions makes an average salary of more than 75000.

**Solution**:
Now, here we first know that we want all positions which are at manager level, looking at the table, we see there are multiple
![](attachments/Pasted%20image%2020250401142932.png)

Therefore, we can use WHERE to filter out the positions while we use HAVING to filter out the Aggregated average salary condition

```sql
SELECT occupation, AVG(salary) AS 'Average Salary'
FROM employee_salary
WHERE occupation LIKE '%manager%'
GROUP BY occupation
HAVING AVG(salary) > 75000
;
```

![](attachments/Pasted%20image%2020250401143256.png)

