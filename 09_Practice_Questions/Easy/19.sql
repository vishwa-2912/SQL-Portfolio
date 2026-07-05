/*
Question:
Display top 3 highest paid employees.
*/

SELECT *
FROM employees
ORDER BY salary DESC
LIMIT 3;
