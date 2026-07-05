/*
Question:
Find duplicate employee first names.
*/

SELECT
    first_name,
    COUNT(*) AS Total
FROM employees
GROUP BY first_name
HAVING COUNT(*) > 1;
