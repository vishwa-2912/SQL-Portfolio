/*
Question:
Display departments having more than 3 employees.
*/

SELECT
    department_id,
    COUNT(*) AS Total_Employees
FROM employees
GROUP BY department_id
HAVING COUNT(*)>3;
