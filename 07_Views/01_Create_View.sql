-- Create View
-- Create a view for employees earning more than 50000.

CREATE VIEW High_Salary_Employees AS

SELECT
    emp_id,
    first_name,
    last_name,
    salary
FROM employees
WHERE salary > 50000;

-- Display the view

SELECT *
FROM High_Salary_Employees;
