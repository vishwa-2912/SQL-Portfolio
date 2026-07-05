/*
Question:
Find duplicate salaries.
*/

SELECT
    salary,
    COUNT(*) AS Total
FROM employees
GROUP BY salary
HAVING COUNT(*) > 1;
