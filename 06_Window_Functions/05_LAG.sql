-- LAG()
-- Display the previous employee's salary.

SELECT
    first_name,
    salary,
    LAG(salary) OVER(ORDER BY salary) AS Previous_Salary
FROM employees;

-- Output:
-- Shows the salary of the previous employee.
