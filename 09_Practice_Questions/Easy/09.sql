/*
Question:
Display employees from London earning above 50000.
*/

SELECT *
FROM employees
WHERE city='London'
AND salary>50000;
