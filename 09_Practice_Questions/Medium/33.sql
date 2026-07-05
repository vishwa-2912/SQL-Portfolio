/*
Question:
Display highest paid employee from each city.
*/

SELECT *
FROM
(
    SELECT
        first_name,
        city,
        salary,
        ROW_NUMBER()
        OVER(PARTITION BY city ORDER BY salary DESC) AS rn
    FROM employees
) t
WHERE rn=1;
