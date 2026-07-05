/*
Question:
Compare each employee's salary with the previous employee.
*/

SELECT
    first_name,
    salary,
    LAG(salary)
    OVER(ORDER BY salary) AS Previous_Salary
FROM employees;
