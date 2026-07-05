/*
Question:
Display the top three highest-paid employees from each department.
*/

SELECT *
FROM
(
    SELECT
        first_name,
        department_id,
        salary,
        DENSE_RANK()
        OVER(
            PARTITION BY department_id
            ORDER BY salary DESC
        ) AS Salary_Rank
    FROM employees
) RankedEmployees
WHERE Salary_Rank <= 3;
