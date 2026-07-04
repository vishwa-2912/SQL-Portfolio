-- Subquery using IN
-- Display employees working in the IT or Finance departments.

SELECT *
FROM employees
WHERE department_id IN
(
    SELECT department_id
    FROM departments
    WHERE department_name IN ('IT','Finance')
);

-- Output:
-- Employees working in IT and Finance.
