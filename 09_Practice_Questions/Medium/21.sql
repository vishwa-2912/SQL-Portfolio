/*
Question:
Display employee names along with their department names.
 Employee + Department INNER JOIN
*/

SELECT
    e.emp_id,
    e.first_name,
    e.last_name,
    d.department_name
FROM employees e
INNER JOIN departments d
ON e.department_id = d.department_id;
