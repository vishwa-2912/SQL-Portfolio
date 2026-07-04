-- EXISTS
-- Display departments that have at least one employee.

SELECT *
FROM departments d
WHERE EXISTS
(
    SELECT *
    FROM employees e
    WHERE e.department_id = d.department_id
);

-- Output:
-- Departments having one or more employees.
