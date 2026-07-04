-- CROSS JOIN
-- Display every possible employee and department combination.

SELECT
    e.first_name,
    d.department_name
FROM employees e
CROSS JOIN departments d;

-- Output:
-- Every employee paired with every department.
