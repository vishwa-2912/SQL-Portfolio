-- FULL OUTER JOIN (MySQL Alternative)

SELECT
    e.first_name,
    d.department_name
FROM employees e
LEFT JOIN departments d
ON e.department_id = d.department_id

UNION

SELECT
    e.first_name,
    d.department_name
FROM employees e
RIGHT JOIN departments d
ON e.department_id = d.department_id;

-- Output:
-- Combines LEFT JOIN and RIGHT JOIN results.
