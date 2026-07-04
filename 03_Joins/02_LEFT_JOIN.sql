-- LEFT JOIN
-- Display all employees even if a department is missing.

SELECT
    e.first_name,
    e.last_name,
    d.department_name
FROM employees e
LEFT JOIN departments d
ON e.department_id = d.department_id;

-- Output:
-- All employees are displayed.
