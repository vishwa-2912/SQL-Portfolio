-- Multiple Row Subquery
-- Display employees working in departments where at least one employee earns more than 70000.

SELECT *
FROM employees
WHERE department_id IN
(
    SELECT department_id
    FROM employees
    WHERE salary > 70000
);

-- Output:
-- Employees belonging to departments that have a salary greater than 70000.
