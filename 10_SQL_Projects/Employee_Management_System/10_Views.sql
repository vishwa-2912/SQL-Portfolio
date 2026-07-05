/*
=========================================================
Employee Management System
10_Views.sql
Author: Vishwa
Description: Business Views for Reporting
=========================================================
*/

-- =====================================================
-- 1. Employee Details View
-- =====================================================

CREATE VIEW vw_employee_details AS
SELECT
    e.employee_id,
    e.first_name,
    e.last_name,
    e.gender,
    e.age,
    e.city,
    e.hire_date,
    e.salary,
    d.department_name,
    j.job_title
FROM employees e
JOIN departments d
ON e.department_id = d.department_id
JOIN jobs j
ON e.job_id = j.job_id;

-- View Data
SELECT * FROM vw_employee_details;

-- =====================================================
-- 2. Department Salary Summary
-- =====================================================

CREATE VIEW vw_department_salary_summary AS
SELECT
    d.department_name,
    COUNT(e.employee_id) AS Total_Employees,
    SUM(e.salary) AS Total_Salary,
    AVG(e.salary) AS Average_Salary,
    MAX(e.salary) AS Highest_Salary,
    MIN(e.salary) AS Lowest_Salary
FROM departments d
LEFT JOIN employees e
ON d.department_id = e.department_id
GROUP BY d.department_name;

SELECT * FROM vw_department_salary_summary;

-- =====================================================
-- 3. Employee Project Details
-- =====================================================

CREATE VIEW vw_employee_projects AS
SELECT
    e.employee_id,
    e.first_name,
    e.last_name,
    p.project_name,
    p.budget
FROM employees e
JOIN employee_projects ep
ON e.employee_id = ep.employee_id
JOIN projects p
ON ep.project_id = p.project_id;

SELECT * FROM vw_employee_projects;

-- =====================================================
-- 4. High Salary Employees
-- =====================================================

CREATE VIEW vw_high_salary_employees AS
SELECT *
FROM employees
WHERE salary > 70000;

SELECT * FROM vw_high_salary_employees;

-- =====================================================
-- 5. London Employees
-- =====================================================

CREATE VIEW vw_london_employees AS
SELECT *
FROM employees
WHERE city = 'London';

SELECT * FROM vw_london_employees;

-- =====================================================
-- 6. Department Managers
-- =====================================================

CREATE VIEW vw_department_managers AS
SELECT
    department_name,
    manager_name
FROM departments;

SELECT * FROM vw_department_managers;

-- =====================================================
-- 7. Project Budget Summary
-- =====================================================

CREATE VIEW vw_project_budget_summary AS
SELECT
    d.department_name,
    COUNT(p.project_id) AS Total_Projects,
    SUM(p.budget) AS Total_Budget,
    AVG(p.budget) AS Average_Budget
FROM departments d
LEFT JOIN projects p
ON d.department_id = p.department_id
GROUP BY d.department_name;

SELECT * FROM vw_project_budget_summary;

-- =====================================================
-- 8. Employee Count by City
-- =====================================================

CREATE VIEW vw_city_employee_count AS
SELECT
    city,
    COUNT(*) AS Total_Employees
FROM employees
GROUP BY city;

SELECT * FROM vw_city_employee_count;

-- =====================================================
-- 9. Employees Hired After 2022
-- =====================================================

CREATE VIEW vw_recent_employees AS
SELECT *
FROM employees
WHERE hire_date > '2022-01-01';

SELECT * FROM vw_recent_employees;

-- =====================================================
-- 10. Complete Employee Report
-- =====================================================

CREATE VIEW vw_complete_employee_report AS
SELECT
    e.employee_id,
    CONCAT(e.first_name,' ',e.last_name) AS Employee_Name,
    d.department_name,
    j.job_title,
    e.salary,
    e.city,
    p.project_name
FROM employees e
LEFT JOIN departments d
ON e.department_id = d.department_id
LEFT JOIN jobs j
ON e.job_id = j.job_id
LEFT JOIN employee_projects ep
ON e.employee_id = ep.employee_id
LEFT JOIN projects p
ON ep.project_id = p.project_id;

SELECT * FROM vw_complete_employee_report;

/*
=========================================================
Useful View Operations
=========================================================
*/

-- Show all views in the database
SHOW FULL TABLES
WHERE TABLE_TYPE = 'VIEW';

-- Display the SQL statement used to create a view
SHOW CREATE VIEW vw_employee_details;

-- Update a view (replace existing definition)
CREATE OR REPLACE VIEW vw_high_salary_employees AS
SELECT *
FROM employees
WHERE salary > 80000;

-- Drop a view
-- DROP VIEW vw_high_salary_employees;

/*
=========================================================
Topics Covered

✓ CREATE VIEW
✓ Querying Views
✓ Aggregate Views
✓ Join Views
✓ Reporting Views
✓ SHOW CREATE VIEW
✓ CREATE OR REPLACE VIEW
✓ DROP VIEW

Total Views Created : 10

=========================================================
END OF FILE
=========================================================
