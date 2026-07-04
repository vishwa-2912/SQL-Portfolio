-- RIGHT JOIN
-- Display all departments even if they have no employees.

SELECT
    e.first_name,
    d.department_name
FROM employees e
RIGHT JOIN departments d
ON e.department_id = d.department_id;

-- Output:
-- Every department is shown.
