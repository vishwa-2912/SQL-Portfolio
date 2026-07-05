/*
Question:
Find each employee's salary as a percentage of their department's total salary.
*/

SELECT
    first_name,
    department_id,
    salary,
    ROUND(
        salary * 100 /
        SUM(salary) OVER(PARTITION BY department_id),
        2
    ) AS Salary_Percentage
FROM employees;
