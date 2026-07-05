-- RANK()
-- Rank employees by salary.

SELECT
    emp_id,
    first_name,
    salary,
    RANK() OVER(ORDER BY salary DESC) AS Salary_Rank
FROM employees;

-- Output:
-- Employees with the same salary receive the same rank.
-- The next rank is skipped.
