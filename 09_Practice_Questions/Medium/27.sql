/*
Question:
Assign dense rank based on salary.
*/

SELECT
    first_name,
    salary,
    DENSE_RANK() OVER(ORDER BY salary DESC) AS Dense_Rank
FROM employees;
