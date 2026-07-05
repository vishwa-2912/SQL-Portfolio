/*
Question:
Display employees earning more than the average salary.
*/

SELECT *
FROM employees
WHERE salary >
(
    SELECT AVG(salary)
    FROM employees
);
