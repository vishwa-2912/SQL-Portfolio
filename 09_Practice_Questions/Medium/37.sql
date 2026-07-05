/*
Question:
Find employees earning above average salary using CTE.
*/

WITH AvgSalary AS
(
    SELECT AVG(salary) avg_sal
    FROM employees
)

SELECT *
FROM employees
WHERE salary >
(
    SELECT avg_sal
    FROM AvgSalary
);
