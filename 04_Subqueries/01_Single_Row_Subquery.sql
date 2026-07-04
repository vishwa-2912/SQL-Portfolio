-- Single Row Subquery
-- Display employees earning more than the average salary.

SELECT *
FROM employees
WHERE salary >
(
    SELECT AVG(salary)
    FROM employees
);

-- Output:
-- Employees whose salary is greater than the company average.
