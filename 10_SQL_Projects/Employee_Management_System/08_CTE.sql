/*
=========================================================
Employee Management System
08_CTE.sql
Author: Vishwa
Description: Business Questions using Common Table Expressions (CTEs)
=========================================================
*/

-- =====================================================
-- 1. Employees Earning Above Company Average Salary
-- =====================================================

WITH CompanyAverage AS
(
    SELECT AVG(salary) AS AvgSalary
    FROM employees
)

SELECT
    employee_id,
    first_name,
    last_name,
    salary
FROM employees
WHERE salary >
(
    SELECT AvgSalary
    FROM CompanyAverage
);

-- =====================================================
-- 2. Average Salary by Department
-- =====================================================

WITH DepartmentAverage AS
(
    SELECT
        department_id,
        AVG(salary) AS AvgSalary
    FROM employees
    GROUP BY department_id
)

SELECT *
FROM DepartmentAverage;

-- =====================================================
-- 3. Employees Above Department Average
-- =====================================================

WITH DepartmentAverage AS
(
    SELECT
        department_id,
        AVG(salary) AS AvgSalary
    FROM employees
    GROUP BY department_id
)

SELECT
    e.employee_id,
    e.first_name,
    e.salary,
    d.AvgSalary
FROM employees e
JOIN DepartmentAverage d
ON e.department_id = d.department_id
WHERE e.salary > d.AvgSalary;

-- =====================================================
-- 4. Total Salary by Department
-- =====================================================

WITH DepartmentSalary AS
(
    SELECT
        department_id,
        SUM(salary) AS TotalSalary
    FROM employees
    GROUP BY department_id
)

SELECT *
FROM DepartmentSalary;

-- =====================================================
-- 5. Department with Highest Salary Expense
-- =====================================================

WITH DepartmentSalary AS
(
    SELECT
        department_id,
        SUM(salary) AS TotalSalary
    FROM employees
    GROUP BY department_id
)

SELECT *
FROM DepartmentSalary
ORDER BY TotalSalary DESC
LIMIT 1;

-- =====================================================
-- 6. Employee and Department Details
-- =====================================================

WITH EmployeeDepartment AS
(
    SELECT
        e.employee_id,
        e.first_name,
        e.last_name,
        d.department_name,
        e.salary
    FROM employees e
    JOIN departments d
    ON e.department_id = d.department_id
)

SELECT *
FROM EmployeeDepartment;

-- =====================================================
-- 7. Employee and Job Details
-- =====================================================

WITH EmployeeJobs AS
(
    SELECT
        e.employee_id,
        e.first_name,
        e.last_name,
        j.job_title,
        e.salary
    FROM employees e
    JOIN jobs j
    ON e.job_id = j.job_id
)

SELECT *
FROM EmployeeJobs;

-- =====================================================
-- 8. Employees and Assigned Projects
-- =====================================================

WITH EmployeeProjects AS
(
    SELECT
        e.employee_id,
        e.first_name,
        e.last_name,
        p.project_name
    FROM employees e
    JOIN employee_projects ep
        ON e.employee_id = ep.employee_id
    JOIN projects p
        ON ep.project_id = p.project_id
)

SELECT *
FROM EmployeeProjects;

-- =====================================================
-- 9. Highest Paid Employee
-- =====================================================

WITH SalaryRank AS
(
    SELECT
        *,
        DENSE_RANK() OVER(ORDER BY salary DESC) AS SalaryRank
    FROM employees
)

SELECT *
FROM SalaryRank
WHERE SalaryRank = 1;

-- =====================================================
-- 10. Second Highest Salary
-- =====================================================

WITH SalaryRank AS
(
    SELECT
        *,
        DENSE_RANK() OVER(ORDER BY salary DESC) AS SalaryRank
    FROM employees
)

SELECT *
FROM SalaryRank
WHERE SalaryRank = 2;

-- =====================================================
-- 11. Third Highest Salary
-- =====================================================

WITH SalaryRank AS
(
    SELECT
        *,
        DENSE_RANK() OVER(ORDER BY salary DESC) AS SalaryRank
    FROM employees
)

SELECT *
FROM SalaryRank
WHERE SalaryRank = 3;

-- =====================================================
-- 12. Employee Count by Department
-- =====================================================

WITH DepartmentCount AS
(
    SELECT
        department_id,
        COUNT(*) AS TotalEmployees
    FROM employees
    GROUP BY department_id
)

SELECT *
FROM DepartmentCount;

-- =====================================================
-- 13. Highest Budget Project
-- =====================================================

WITH ProjectBudget AS
(
    SELECT
        project_id,
        project_name,
        budget
    FROM projects
)

SELECT *
FROM ProjectBudget
ORDER BY budget DESC
LIMIT 1;

-- =====================================================
-- 14. Total Project Budget
-- =====================================================

WITH BudgetSummary AS
(
    SELECT
        SUM(budget) AS TotalBudget
    FROM projects
)

SELECT *
FROM BudgetSummary;

-- =====================================================
-- 15. Employees Without Projects
-- =====================================================

WITH AssignedEmployees AS
(
    SELECT employee_id
    FROM employee_projects
)

SELECT *
FROM employees
WHERE employee_id NOT IN
(
    SELECT employee_id
    FROM AssignedEmployees
);

-- =====================================================
-- 16. Employees Hired After 2022
-- =====================================================

WITH RecentEmployees AS
(
    SELECT *
    FROM employees
    WHERE hire_date > '2022-01-01'
)

SELECT *
FROM RecentEmployees;

-- =====================================================
-- 17. Employees from London
-- =====================================================

WITH LondonEmployees AS
(
    SELECT *
    FROM employees
    WHERE city = 'London'
)

SELECT *
FROM LondonEmployees;

-- =====================================================
-- 18. Average Employee Age
-- =====================================================

WITH AgeSummary AS
(
    SELECT AVG(age) AS AverageAge
    FROM employees
)

SELECT *
FROM AgeSummary;

-- =====================================================
-- 19. Employees Older Than Company Average Age
-- =====================================================

WITH AverageAge AS
(
    SELECT AVG(age) AS AvgAge
    FROM employees
)

SELECT
    employee_id,
    first_name,
    age
FROM employees
WHERE age >
(
    SELECT AvgAge
    FROM AverageAge
);

-- =====================================================
-- 20. Complete Employee Report
-- =====================================================

WITH EmployeeReport AS
(
    SELECT
        e.employee_id,
        e.first_name,
        e.last_name,
        d.department_name,
        j.job_title,
        e.salary,
        e.city,
        e.hire_date
    FROM employees e
    JOIN departments d
        ON e.department_id = d.department_id
    JOIN jobs j
        ON e.job_id = j.job_id
)

SELECT *
FROM EmployeeReport
ORDER BY salary DESC;

/*
=========================================================
END OF FILE
=========================================================

Topics Covered:

✔ Basic CTE
✔ Multiple CTE
✔ Aggregation with CTE
✔ CTE + JOIN
✔ CTE + Window Functions
✔ Business Reporting
✔ HR Analytics
✔ Salary Analysis
✔ Project Analysis

Total Questions: 20
=========================================================
*/
