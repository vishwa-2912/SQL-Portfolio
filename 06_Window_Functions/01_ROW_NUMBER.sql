-- ROW_NUMBER()
-- Assign a unique row number based on salary.

SELECT
    emp_id,
    first_name,
    salary,
    ROW_NUMBER() OVER(ORDER BY salary DESC) AS Row_Number
FROM employees;

-- Output:
-- Employees numbered from highest salary to lowest.
