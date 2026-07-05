-- FIRST_VALUE()
-- Display the highest salary for every employee.

SELECT
    first_name,
    salary,
    FIRST_VALUE(salary)
    OVER(ORDER BY salary DESC) AS Highest_Salary
FROM employees;

-- Output:
-- Highest salary appears in every row.
