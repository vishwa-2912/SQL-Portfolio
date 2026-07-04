-- Subquery in FROM Clause
-- Display the average salary of each department using a derived table.

SELECT
    department_name,
    Average_Salary
FROM
(
    SELECT
        d.department_name,
        AVG(e.salary) AS Average_Salary
    FROM employees e
    INNER JOIN departments d
        ON e.department_id = d.department_id
    GROUP BY d.department_name
) AS DepartmentSalary;

-- Output:
-- Department Name    Average Salary
-- Finance           80000
-- HR                46000
-- IT                60000
-- Sales             41000
