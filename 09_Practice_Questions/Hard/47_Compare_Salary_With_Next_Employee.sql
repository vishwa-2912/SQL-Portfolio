/*
Question:
Compare each employee's salary with the next employee.
*/

SELECT
    first_name,
    salary,
    LEAD(salary)
    OVER(ORDER BY salary) AS Next_Salary
FROM employees;
