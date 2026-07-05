/*
Question:
Display employees who are not assigned to any department.
*/

SELECT *
FROM employees
WHERE department_id IS NULL;
