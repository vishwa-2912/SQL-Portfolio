/*
Question:
Calculate the running total salary within each department.
*/

SELECT
    first_name,
    department_id,
    salary,
    SUM(salary)
    OVER(
        PARTITION BY department_id
        ORDER BY salary
    ) AS Running_Total
FROM employees;
