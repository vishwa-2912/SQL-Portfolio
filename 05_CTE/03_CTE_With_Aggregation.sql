-- CTE with Aggregation
-- Find average salary per department

WITH DeptAvg AS (
    SELECT
        department_id,
        AVG(salary) AS avg_salary
    FROM employees
    GROUP BY department_id
)

SELECT *
FROM DeptAvg;

-- Output:
-- department_id | avg_salary
