-- Correlated Subquery
-- Display employees whose salary is greater than the average salary of their own department.

SELECT *
FROM employees e1
WHERE salary >
(
    SELECT AVG(salary)
    FROM employees e2
    WHERE e1.department_id = e2.department_id
);

-- Output:
-- Employees earning above their department's average salary.
