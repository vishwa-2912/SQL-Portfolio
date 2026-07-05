-- LEAD()
-- Display the next employee's salary.

SELECT
    first_name,
    salary,
    LEAD(salary) OVER(ORDER BY salary) AS Next_Salary
FROM employees;

-- Output:
-- Shows the salary of the next employee.
