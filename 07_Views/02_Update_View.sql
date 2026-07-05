-- Update View
-- Replace the existing view with additional columns.

CREATE OR REPLACE VIEW High_Salary_Employees AS

SELECT
    emp_id,
    first_name,
    last_name,
    salary,
    city
FROM employees
WHERE salary > 50000;

-- Display updated view

SELECT *
FROM High_Salary_Employees;
