/*
Question:
Display employees working in departments having more than two employees.
*/

SELECT *
FROM employees
WHERE department_id IN
(
    SELECT department_id
    FROM employees
    GROUP BY department_id
    HAVING COUNT(*)>2
);
