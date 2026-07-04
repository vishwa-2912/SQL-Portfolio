-- Employees working in IT or HR

SELECT *
FROM employees
WHERE department IN ('IT','HR');

-- Output:
-- Returns employees from IT and HR departments.
