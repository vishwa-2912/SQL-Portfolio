/*
Question:
Display number of employees in each department.
*/

SELECT
department_id,
COUNT(*)
FROM employees
GROUP BY department_id;
