-- LAST_VALUE()
-- Display the lowest salary.

SELECT
    first_name,
    salary,
    LAST_VALUE(salary)
    OVER(
        ORDER BY salary
        ROWS BETWEEN UNBOUNDED PRECEDING
        AND UNBOUNDED FOLLOWING
    ) AS Lowest_Salary
FROM employees;

-- Output:
-- Lowest salary appears in every row.
