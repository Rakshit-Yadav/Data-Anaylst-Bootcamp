#### Rough Notes while listening to video
- union allows to combine rows together 

- so basically joins helped us join columns of different table

- unions allows to combine rows of different tables OR same tables as well.

- we combine 2 select statements and combine them with union

- It won't always work if the data we are working with is bad, we have to see how to connect the statements so that it works properly

- `UNION`, by default, is `UNION DISTINCT` and distinct means removing duplicates

- to show everything, without removing duplicates, we use `UNION ALL`


*Good use case* :- if the park department is trying to cut budget, they are trying to look for old people to fire or also identify high-paying employees so that they can either reduce their pay or push them out as well.

```SQL
SELECT first_name, last_name, 'Old Man' AS Label
FROM employee_demographics
WHERE age > 40 AND gender = 'Male'
UNION
SELECT first_name, last_name, 'Old Lady' AS Label
FROM employee_demographics
WHERE age > 40 AND gender = 'Female'
UNION
SELECT first_name, last_name, 'Highly Paid Employee' AS Label
FROM employee_salary
WHERE salary > 70000
ORDER BY first_name, last_name
;
```

OUTPUT:
 ![](attachments/Pasted%20image%2020250515154819.png)

 