/*
Question:
Rank employees based on salary.
*/

SELECT
    first_name,
    salary,
    RANK() OVER(ORDER BY salary DESC) AS Salary_Rank
FROM employees;
