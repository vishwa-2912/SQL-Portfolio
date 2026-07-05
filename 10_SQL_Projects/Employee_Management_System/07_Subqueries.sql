/*
=========================================================
Employee Management System
07_Subqueries.sql
Author: Vishwa
Description: Business Questions using SQL Subqueries
=========================================================
*/

-- =====================================================
-- 1. Employees Earning Above Company Average
-- =====================================================

SELECT
    employee_id,
    first_name,
    last_name,
    salary
FROM employees
WHERE salary >
(
    SELECT AVG(salary)
    FROM employees
);

-- =====================================================
-- 2. Employees Earning Above Department Average
-- =====================================================

SELECT
    employee_id,
    first_name,
    last_name,
    department_id,
    salary
FROM employees e
WHERE salary >
(
    SELECT AVG(salary)
    FROM employees
    WHERE department_id = e.department_id
);

-- =====================================================
-- 3. Highest Paid Employee
-- =====================================================

SELECT *
FROM employees
WHERE salary =
(
    SELECT MAX(salary)
    FROM employees
);

-- =====================================================
-- 4. Lowest Paid Employee
-- =====================================================

SELECT *
FROM employees
WHERE salary =
(
    SELECT MIN(salary)
    FROM employees
);

-- =====================================================
-- 5. Employees Working on Highest Budget Project
-- =====================================================

SELECT
    e.employee_id,
    e.first_name,
    e.last_name
FROM employees e
JOIN employee_projects ep
ON e.employee_id = ep.employee_id
WHERE ep.project_id =
(
    SELECT project_id
    FROM projects
    ORDER BY budget DESC
    LIMIT 1
);

-- =====================================================
-- 6. Department with Highest Salary Expense
-- =====================================================

SELECT
    department_id,
    SUM(salary) AS TotalSalary
FROM employees
GROUP BY department_id
HAVING SUM(salary) =
(
    SELECT MAX(TotalSalary)
    FROM
    (
        SELECT
            SUM(salary) AS TotalSalary
        FROM employees
        GROUP BY department_id
    ) AS SalaryTotals
);

-- =====================================================
-- 7. Employees in Largest Department
-- =====================================================

SELECT *
FROM employees
WHERE department_id =
(
    SELECT department_id
    FROM employees
    GROUP BY department_id
    ORDER BY COUNT(*) DESC
    LIMIT 1
);

-- =====================================================
-- 8. Employees Without Projects
-- =====================================================

SELECT *
FROM employees
WHERE employee_id NOT IN
(
    SELECT employee_id
    FROM employee_projects
);

-- =====================================================
-- 9. Projects Without Employees
-- =====================================================

SELECT *
FROM projects
WHERE project_id NOT IN
(
    SELECT project_id
    FROM employee_projects
);

-- =====================================================
-- 10. Employees Hired After Average Hire Date
-- =====================================================

SELECT *
FROM employees
WHERE hire_date >
(
    SELECT DATE_ADD
    (
        MIN(hire_date),
        INTERVAL DATEDIFF(MAX(hire_date), MIN(hire_date))/2 DAY
    )
    FROM employees
);

-- =====================================================
-- 11. Highest Paid Employee in Each Department
-- =====================================================

SELECT *
FROM employees e
WHERE salary =
(
    SELECT MAX(salary)
    FROM employees
    WHERE department_id = e.department_id
);

-- =====================================================
-- 12. Lowest Paid Employee in Each Department
-- =====================================================

SELECT *
FROM employees e
WHERE salary =
(
    SELECT MIN(salary)
    FROM employees
    WHERE department_id = e.department_id
);

-- =====================================================
-- 13. Employees Above Job Average Salary
-- =====================================================

SELECT *
FROM employees e
WHERE salary >
(
    SELECT AVG(salary)
    FROM employees
    WHERE job_id = e.job_id
);

-- =====================================================
-- 14. Departments Spending Above Average Salary Cost
-- =====================================================

SELECT
    department_id,
    SUM(salary) AS TotalSalary
FROM employees
GROUP BY department_id
HAVING SUM(salary) >
(
    SELECT AVG(DeptSalary)
    FROM
    (
        SELECT
            SUM(salary) AS DeptSalary
        FROM employees
        GROUP BY department_id
    ) AS DepartmentTotals
);

-- =====================================================
-- 15. Employees Working in IT Department
-- =====================================================

SELECT *
FROM employees
WHERE department_id =
(
    SELECT department_id
    FROM departments
    WHERE department_name = 'IT'
);

-- =====================================================
-- 16. Employees Working on AI Research Project
-- =====================================================

SELECT
    first_name,
    last_name
FROM employees
WHERE employee_id IN
(
    SELECT employee_id
    FROM employee_projects
    WHERE project_id =
    (
        SELECT project_id
        FROM projects
        WHERE project_name = 'AI Research'
    )
);

-- =====================================================
-- 17. Departments Without Employees
-- =====================================================

SELECT *
FROM departments
WHERE department_id NOT IN
(
    SELECT DISTINCT department_id
    FROM employees
);

-- =====================================================
-- 18. Jobs Without Employees
-- =====================================================

SELECT *
FROM jobs
WHERE job_id NOT IN
(
    SELECT DISTINCT job_id
    FROM employees
);

-- =====================================================
-- 19. Employees Above Department Average (Alternative)
-- =====================================================

SELECT
    employee_id,
    first_name,
    salary
FROM employees e
WHERE salary >
(
    SELECT AVG(salary)
    FROM employees
    WHERE department_id = e.department_id
);

-- =====================================================
-- 20. Second Highest Salary
-- =====================================================

SELECT
    MAX(salary) AS SecondHighestSalary
FROM employees
WHERE salary <
(
    SELECT MAX(salary)
    FROM employees
);

/*
=========================================================
END OF FILE
=========================================================

