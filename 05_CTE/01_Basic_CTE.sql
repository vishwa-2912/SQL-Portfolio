-- Basic CTE
-- Find employees earning more than average salary

WITH AvgSalary AS (
    SELECT AVG(salary) AS avg_salary
    FROM employees
)

SELECT *
FROM employees
WHERE salary > (SELECT avg_salary FROM AvgSalary);

-- Output:
-- Employees earning above average salary
