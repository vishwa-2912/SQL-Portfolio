/*
Question:
Calculate the running total of salaries.
*/

SELECT
    first_name,
    salary,
    SUM(salary)
    OVER(ORDER BY salary) AS Running_Total
FROM employees;
