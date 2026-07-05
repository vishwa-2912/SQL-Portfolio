-- Complex View
-- Display employee details with department names.

CREATE VIEW Employee_Department_View AS

SELECT
    e.emp_id,
    e.first_name,
    e.last_name,
    d.department_name,
    e.salary
FROM employees e
JOIN departments d
ON e.department_id = d.department_id;

-- Display the view

SELECT *
FROM Employee_Department_View;
