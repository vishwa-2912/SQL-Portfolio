/*
Question:
Find the second highest salary.
*/

SELECT MAX(salary) AS Second_Highest_Salary
FROM employees
WHERE salary <
(
    SELECT MAX(salary)
    FROM employees
);
