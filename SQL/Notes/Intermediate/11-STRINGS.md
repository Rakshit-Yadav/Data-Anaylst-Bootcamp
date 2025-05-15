# String functions

- Different Kind of functions available to manipulate text and retrieve different kind of information.
- A good article to just glance over and maybe refresh through some great ones is also this : [GeeksforGeeks SQL STRING FUNCTIONS](https://www.geeksforgeeks.org/sql-string-functions/) 

##### LENGTH
- Just tells us the length of the string we pass it with, how many characters are in there

![](attachments/Pasted%20image%2020250515160412.png)

> Realistic use case for LENGTH function
> Phone numbers, making sure they are 10 digits is a good thing.

##### UPPER or LOWER
- Gives us back either all caps or all lower respectively
- Helpful for *standardisation*


##### TRIM
- Takes white spaces in the specified one and gets rid of it.
- Multiple trims
	- TRIM
	- LEFT TRIM
	- RIGHT TRIM
- Example:
	- Without TRIM:![](attachments/Pasted%20image%2020250515160801.png)
	- With TRIM (gets rid of the leading and trailing white spaces): ![](attachments/Pasted%20image%2020250515160855.png)
- LEFT TRIM (`LTRIM`) and RIGHT TRIM (`RTRIM`), in this same context would do what they sound like, specifically remove white spaces from either end.


#### SUBSTRING

- To understand this, we can first look at `LEFT` and `RIGHT` functions,

##### LEFT

```SQL
SELECT first_name, LEFT(first_name, 4)
FROM employee_demographics;
```

- This is basically specifying how many characters to take from left and moving forward in the column first_name and display it. ![](attachments/Pasted%20image%2020250515161413.png)
##### RIGHT

![](attachments/Pasted%20image%2020250515164811.png)

- Right is also basically the same, opposite of left, choosing the specific amount of characters from the right and moving backward.

##### SUBSTRING

- This gives us precise control of where to start extracting and how much to extract
- syntax: `SUBSTRING (column, STARTING POSITON, Number of CHARACTERS to Extract)`

```SQL
SELECT first_name,
LEFT (first_name, 4),
RIGHT (first_name, 4),
SUBSTRING (first_name, 3,2)
FROM employee_demographics;
```
- **POINT TO NOTE** → The starting position character is going to be included, so that should be taken into account.

> Another good use case:
> 	Extraction of birth month/year/date from birth_date column

```SQL
SELECT first_name, last_name,
SUBSTRING(birth_date, 6,2) AS 'Birth Month'
FROM employee_demographics;
```
OUTPUT: ![](attachments/Pasted%20image%2020250515170811.png)


#### REPLACE

- syntax: `REPLACE (column, 'what to replace', 'with what to relpace with')`

```SQL
SELECT first_name, REPLACE(first_name, 'a', 'z')
FROM employee_demographics
;
```
OUTPUT: ![](attachments/Pasted%20image%2020250515171654.png)

#### LOCATE

- It located the position of the string character we are looking for in a full string given and tells us the position number for it.

> SQL indexing starts from 1, I think so, so have to keep this in mind.

- Example use case for our database:
```SQL
SELECT first_name, LOCATE('An', first_name)
FROM employee_demographics
;
```
OUTPUT: ![](attachments/Pasted%20image%2020250515172137.png)


#### CONCATENATE

- For combining columns, `CONCAT()`

![](attachments/Pasted%20image%2020250515172525.png)

- this concat example is a very common one and a very used one as well, I believe this function is going to be the most useful and most used as well in real world setting. 