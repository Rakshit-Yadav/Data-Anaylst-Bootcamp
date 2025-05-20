#### CASE Statement
- It allows to add logic to a query

**Problem statement**: Council sent out a memo for pay increase, gotta follow it and determine people's new end of year salary and if they got a bonus, how much was it.
Pay Increase and Bonus:
- < 50000 = 5%
- > 50000 = 7%
- Finance department = 10% bonus

```SQL
SELECT first_name, last_name, salary,
CASE
	WHEN salary < 50000 THEN salary * 1.05
    WHEN salary > 50000 THEN salary * 1.07
END AS 'New_Raised_Salary',
CASE
	WHEN dept_id = 6 THEN salary * 0.10
END AS 'Bonus'
FROM employee_salary
;
```
OUTPUT: ![](attachments/Pasted%20image%2020250515175142.png)

- Another use case of **labelling** things

![](attachments/Pasted%20image%2020250515175105.png)


- Test messsage: checking the access of new updated token and testing sync, this will be removed in further commits obviously.