
#### LIMIT

- ```LIMIT``` → To specify how many rows we want in our output
- limit can be combined with order by to be more powerful
- ```LIMIT 2``` would mean display 2 rows but ```LIMIT 2, 1``` would mean after that 2nd row, display the next row
- this means ```LIMIT *x*, *y*``` means after *x* row(s), display the next *y* row(s).
- the same can be written as ```LIMIT *x* OFFSET *y*``` but for this it would mean "return only *x* records, starting on record"

![](attachments/Pasted%20image%2020250401144443.png)

FULL TABLE ORDERED BY DESCENDING AGE
![](attachments/Pasted%20image%2020250401144730.png)


![](attachments/Pasted%20image%2020250401144516.png)


![](attachments/Pasted%20image%2020250401145009.png)


![](attachments/Pasted%20image%2020250401145123.png)


#### ALIASING
- Change the name of the column displayed to something.
- give a displayed column or any aggregated function an alias which can be used further in the query so that we don't have to type it again and again

Two things to notice here:
1. aliases can be set by saying  AVG(salary) AS "Average Salary"
2. or it can be done like this AVG(salary) AS Average_Salary

The only difference to this is that we have to define it as text when we have space, that's why we used quotes. BUT if we want to use an alias after like in HAVING and don't want to type the aggregate again and again, it is better to have a name which doesn't have any spaces, hence doesn't has to be defined in quotes, which then can be used an as alias anywhere.

**WRONG query examples**

![](attachments/Pasted%20image%2020250401150038.png)
ERROR

![](attachments/Pasted%20image%2020250401150059.png)
It runs but nothing is displayed as Text can't be filtered in HAVING

**CORRECT Query**

```sql
SELECT occupation, AVG(salary) AS Average_Salary
FROM employee_salary
WHERE occupation LIKE '%manager%'
GROUP BY occupation
HAVING Average_Salary > 75000
;
```

![](attachments/Pasted%20image%2020250401150210.png)
