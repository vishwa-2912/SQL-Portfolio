-- NTILE()
-- Divide employees into 4 salary groups.

SELECT
    first_name,
    salary,
    NTILE(4) OVER(ORDER BY salary DESC) AS Salary_Group
FROM employees;

-- Output:
-- Employees divided into four groups based on salary.
