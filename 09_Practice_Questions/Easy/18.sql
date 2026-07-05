/*
Question:
Display employees from London or Manchester.
*/

SELECT *
FROM employees
WHERE city IN('London','Manchester');
