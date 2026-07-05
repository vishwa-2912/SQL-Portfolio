-- DENSE_RANK()
-- Rank employees without skipping rank numbers.

SELECT
    emp_id,
    first_name,
    salary,
    DENSE_RANK() OVER(ORDER BY salary DESC) AS Dense_Rank
FROM employees;

-- Output:
-- Same salaries share the same rank.
-- No ranks are skipped.
