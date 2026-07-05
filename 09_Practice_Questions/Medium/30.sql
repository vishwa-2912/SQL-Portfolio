/*
Question:
Display average salary for each department.
*/

SELECT
    department_id,
    AVG(salary) AS Average_Salary
FROM employees
GROUP BY department_id;
