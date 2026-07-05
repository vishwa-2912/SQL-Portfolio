/*
Question:
Assign row numbers according to salary.
*/

SELECT
    first_name,
    salary,
    ROW_NUMBER() OVER(ORDER BY salary DESC) AS Row_Number
FROM employees;
