/*
Question:
Display lowest paid employee in every department.
*/

SELECT *
FROM
(
    SELECT
        first_name,
        department_id,
        salary,
        ROW_NUMBER()
        OVER(PARTITION BY department_id ORDER BY salary)
        AS rn
    FROM employees
) t
WHERE rn=1;
