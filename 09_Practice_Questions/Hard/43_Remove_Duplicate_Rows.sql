/*
Question:
Delete duplicate employees while keeping the smallest emp_id.
*/

DELETE e1
FROM employees e1
JOIN employees e2
ON e1.first_name = e2.first_name
AND e1.last_name = e2.last_name
AND e1.emp_id > e2.emp_id;
