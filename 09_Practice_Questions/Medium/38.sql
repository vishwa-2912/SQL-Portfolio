/*
Question:
Display employee and department details using CTE.
*/

WITH EmployeeDetails AS
(
    SELECT
        e.emp_id,
        e.first_name,
        e.salary,
        d.department_name
    FROM employees e
    JOIN departments d
    ON e.department_id=d.department_id
)

SELECT *
FROM EmployeeDetails;
