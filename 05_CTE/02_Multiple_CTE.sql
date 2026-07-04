-- Multiple CTEs
-- Separate IT employees and HR employees

WITH IT_Employees AS (
    SELECT *
    FROM employees
    WHERE department_id = 1
),
HR_Employees AS (
    SELECT *
    FROM employees
    WHERE department_id = 2
)

SELECT 'IT' AS dept, COUNT(*) AS total FROM IT_Employees
UNION
SELECT 'HR', COUNT(*) FROM HR_Employees;

-- Output:
-- Count of employees in IT and HR
