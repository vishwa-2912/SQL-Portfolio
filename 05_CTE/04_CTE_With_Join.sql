-- CTE with JOIN
-- Show employee name with department name

WITH EmpCTE AS (
    SELECT
        e.emp_id,
        e.first_name,
        e.salary,
        e.department_id,
        d.department_name
    FROM employees e
    JOIN departments d
        ON e.department_id = d.department_id
)

SELECT *
FROM EmpCTE;

-- Output:
-- Employee details with department names
