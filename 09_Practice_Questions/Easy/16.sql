/*
Question:
Display departments having more than 2 employees.
*/

SELECT
department_id,
COUNT(*)
FROM employees
GROUP BY department_id
HAVING COUNT(*)>2;
