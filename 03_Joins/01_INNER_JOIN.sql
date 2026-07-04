-- INNER JOIN
-- Display employee names along with their department.

SELECT
    e.first_name,
    e.last_name,
    d.department_name
FROM employees e
INNER JOIN departments d
ON e.department_id = d.department_id;

-- Output:
-- Employees matched with their departments.
