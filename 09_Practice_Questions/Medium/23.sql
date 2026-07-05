/*
Question:
Display the highest salary in each department.
*/

SELECT
    department_id,
    MAX(salary) AS Highest_Salary
FROM employees
GROUP BY department_id;
