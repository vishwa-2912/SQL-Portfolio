/*
=========================================================
Employee Management System
12_Advanced_Business_Analytics.sql

Description:
Advanced Business Analytics using SQL

=========================================================
*/

-- =====================================================
-- 1. Company KPI Dashboard
-- =====================================================

SELECT
COUNT(*) AS Total_Employees,
ROUND(AVG(salary),2) AS Average_Salary,
MAX(salary) AS Highest_Salary,
MIN(salary) AS Lowest_Salary,
SUM(salary) AS Total_Salary_Budget
FROM employees;


-- =====================================================
-- 2. Department Wise Employee Count
-- =====================================================

SELECT
d.department_name,
COUNT(e.employee_id) AS Employees
FROM departments d
LEFT JOIN employees e
ON d.department_id=e.department_id
GROUP BY d.department_name
ORDER BY Employees DESC;


-- =====================================================
-- 3. Department Wise Salary Expense
-- =====================================================

SELECT
d.department_name,
SUM(e.salary) AS Salary_Expense
FROM departments d
JOIN employees e
ON d.department_id=e.department_id
GROUP BY d.department_name
ORDER BY Salary_Expense DESC;


-- =====================================================
-- 4. Department Wise Average Salary
-- =====================================================

SELECT
d.department_name,
ROUND(AVG(e.salary),2) AS Average_Salary
FROM departments d
JOIN employees e
ON d.department_id=e.department_id
GROUP BY d.department_name
ORDER BY Average_Salary DESC;


-- =====================================================
-- 5. Highest Paid Employee in Every Department
-- =====================================================

WITH SalaryRank AS
(
SELECT
e.*,
d.department_name,
ROW_NUMBER() OVER
(
PARTITION BY department_id
ORDER BY salary DESC
) RN
FROM employees e
JOIN departments d
ON e.department_id=d.department_id
)

SELECT *
FROM SalaryRank
WHERE RN=1;


-- =====================================================
-- 6. Lowest Paid Employee in Every Department
-- =====================================================

WITH SalaryRank AS
(
SELECT
e.*,
d.department_name,
ROW_NUMBER() OVER
(
PARTITION BY department_id
ORDER BY salary
) RN
FROM employees e
JOIN departments d
ON e.department_id=d.department_id
)

SELECT *
FROM SalaryRank
WHERE RN=1;


-- =====================================================
-- 7. Employees Earning Above Department Average
-- =====================================================

SELECT
employee_id,
first_name,
last_name,
salary,
department_id
FROM employees e
WHERE salary>
(
SELECT AVG(salary)
FROM employees
WHERE department_id=e.department_id
);


-- =====================================================
-- 8. Gender Distribution
-- =====================================================

SELECT
gender,
COUNT(*) Total_Employees
FROM employees
GROUP BY gender;


-- =====================================================
-- 9. Employees by City
-- =====================================================

SELECT
city,
COUNT(*) Employees
FROM employees
GROUP BY city
ORDER BY Employees DESC;


-- =====================================================
-- 10. Hiring Trend
-- =====================================================

SELECT
YEAR(hire_date) Hiring_Year,
COUNT(*) Employees_Hired
FROM employees
GROUP BY YEAR(hire_date)
ORDER BY Hiring_Year;



-- =====================================================
-- 11. Average Employee Age by Department
-- =====================================================

SELECT
d.department_name,
ROUND(AVG(e.age),2) AS Average_Age
FROM departments d
JOIN employees e
ON d.department_id=e.department_id
GROUP BY d.department_name
ORDER BY Average_Age DESC;


-- =====================================================
-- 12. Employees Older Than Company Average Age
-- =====================================================

SELECT
employee_id,
first_name,
last_name,
age
FROM employees
WHERE age >
(
SELECT AVG(age)
FROM employees
)
ORDER BY age DESC;


-- =====================================================
-- 13. Employees Without Any Project
-- =====================================================

SELECT
e.employee_id,
e.first_name,
e.last_name
FROM employees e
LEFT JOIN employee_projects ep
ON e.employee_id=ep.employee_id
WHERE ep.project_id IS NULL;


-- =====================================================
-- 14. Projects Without Employees
-- =====================================================

SELECT
p.project_id,
p.project_name
FROM projects p
LEFT JOIN employee_projects ep
ON p.project_id=ep.project_id
WHERE ep.employee_id IS NULL;


-- =====================================================
-- 15. Total Project Budget by Department
-- =====================================================

SELECT
d.department_name,
SUM(p.budget) AS Total_Budget
FROM departments d
JOIN projects p
ON d.department_id=p.department_id
GROUP BY d.department_name
ORDER BY Total_Budget DESC;


-- =====================================================
-- 16. Highest Budget Project
-- =====================================================

SELECT *
FROM projects
WHERE budget=
(
SELECT MAX(budget)
FROM projects
);


-- =====================================================
-- 17. Lowest Budget Project
-- =====================================================

SELECT *
FROM projects
WHERE budget=
(
SELECT MIN(budget)
FROM projects
);


-- =====================================================
-- 18. Employee Count by Job Role
-- =====================================================

SELECT
j.job_title,
COUNT(e.employee_id) AS Employees
FROM jobs j
LEFT JOIN employees e
ON j.job_id=e.job_id
GROUP BY j.job_title
ORDER BY Employees DESC;


-- =====================================================
-- 19. Average Salary by Job Role
-- =====================================================

SELECT
j.job_title,
ROUND(AVG(e.salary),2) AS Average_Salary
FROM jobs j
JOIN employees e
ON j.job_id=e.job_id
GROUP BY j.job_title
ORDER BY Average_Salary DESC;


-- =====================================================
-- 20. Highest Paid Employee in Each Job Role
-- =====================================================

WITH JobSalaryRank AS
(
SELECT
e.employee_id,
e.first_name,
e.last_name,
j.job_title,
e.salary,
ROW_NUMBER() OVER
(
PARTITION BY j.job_title
ORDER BY e.salary DESC
) AS RN
FROM employees e
JOIN jobs j
ON e.job_id=j.job_id
)

SELECT *
FROM JobSalaryRank
WHERE RN=1;



-- =====================================================
-- 21. Employees with More Than 3 Years of Service
-- =====================================================

SELECT
employee_id,
first_name,
last_name,
hire_date,
TIMESTAMPDIFF(YEAR, hire_date, CURDATE()) AS Years_of_Service
FROM employees
WHERE TIMESTAMPDIFF(YEAR, hire_date, CURDATE()) > 3
ORDER BY Years_of_Service DESC;


-- =====================================================
-- 22. Monthly Hiring Trend
-- =====================================================

SELECT
MONTHNAME(hire_date) AS Hiring_Month,
COUNT(*) AS Employees_Hired
FROM employees
GROUP BY MONTH(hire_date), MONTHNAME(hire_date)
ORDER BY MONTH(hire_date);


-- =====================================================
-- 23. Salary Distribution (Bands)
-- =====================================================

SELECT
CASE
    WHEN salary < 50000 THEN 'Below 50K'
    WHEN salary BETWEEN 50000 AND 70000 THEN '50K - 70K'
    WHEN salary BETWEEN 70001 AND 90000 THEN '70K - 90K'
    ELSE 'Above 90K'
END AS Salary_Band,
COUNT(*) AS Employees
FROM employees
GROUP BY Salary_Band
ORDER BY Employees DESC;


-- =====================================================
-- 24. Employees in Top Salary Quartile
-- =====================================================

WITH SalaryQuartile AS
(
SELECT *,
NTILE(4) OVER(ORDER BY salary DESC) AS Quartile
FROM employees
)

SELECT *
FROM SalaryQuartile
WHERE Quartile = 1;


-- =====================================================
-- 25. Department Salary Percentage of Company Salary
-- =====================================================

SELECT
d.department_name,
SUM(e.salary) AS Department_Salary,
ROUND(
SUM(e.salary) * 100 /
(SELECT SUM(salary) FROM employees),2
) AS Salary_Percentage
FROM employees e
JOIN departments d
ON e.department_id=d.department_id
GROUP BY d.department_name
ORDER BY Salary_Percentage DESC;


-- =====================================================
-- 26. Top 5 Highest Paid Employees
-- =====================================================

SELECT
employee_id,
first_name,
last_name,
salary
FROM employees
ORDER BY salary DESC
LIMIT 5;


-- =====================================================
-- 27. Bottom 5 Lowest Paid Employees
-- =====================================================

SELECT
employee_id,
first_name,
last_name,
salary
FROM employees
ORDER BY salary
LIMIT 5;


-- =====================================================
-- 28. Department Salary Ranking
-- =====================================================

WITH DepartmentSalary AS
(
SELECT
d.department_name,
SUM(e.salary) AS Total_Salary
FROM employees e
JOIN departments d
ON e.department_id=d.department_id
GROUP BY d.department_name
)

SELECT *,
RANK() OVER(ORDER BY Total_Salary DESC) AS Department_Rank
FROM DepartmentSalary;


-- =====================================================
-- 29. Employees Earning More Than Job Maximum Salary
-- =====================================================

SELECT
e.employee_id,
e.first_name,
j.job_title,
e.salary,
j.maximum_salary
FROM employees e
JOIN jobs j
ON e.job_id=j.job_id
WHERE e.salary > j.maximum_salary;


-- =====================================================
-- 30. Employees Earning Less Than Job Minimum Salary
-- =====================================================

SELECT
e.employee_id,
e.first_name,
j.job_title,
e.salary,
j.minimum_salary
FROM employees e
JOIN jobs j
ON e.job_id=j.job_id
WHERE e.salary < j.minimum_salary;




-- =====================================================
-- 31. Average Years of Service by Department
-- =====================================================

SELECT
    d.department_name,
    ROUND(AVG(TIMESTAMPDIFF(YEAR,e.hire_date,CURDATE())),2) AS Avg_Years_Service
FROM employees e
JOIN departments d
ON e.department_id=d.department_id
GROUP BY d.department_name
ORDER BY Avg_Years_Service DESC;


-- =====================================================
-- 32. Employee Count by Gender in Each Department
-- =====================================================

SELECT
    d.department_name,
    e.gender,
    COUNT(*) AS Total_Employees
FROM employees e
JOIN departments d
ON e.department_id=d.department_id
GROUP BY d.department_name,e.gender
ORDER BY d.department_name;


-- =====================================================
-- 33. City Wise Average Salary
-- =====================================================

SELECT
    city,
    ROUND(AVG(salary),2) AS Average_Salary
FROM employees
GROUP BY city
ORDER BY Average_Salary DESC;


-- =====================================================
-- 34. Top Paying City
-- =====================================================

SELECT
    city,
    ROUND(AVG(salary),2) AS Average_Salary
FROM employees
GROUP BY city
ORDER BY Average_Salary DESC
LIMIT 1;


-- =====================================================
-- 35. Department with Maximum Employees
-- =====================================================

SELECT
    d.department_name,
    COUNT(e.employee_id) AS Employee_Count
FROM departments d
JOIN employees e
ON d.department_id=e.department_id
GROUP BY d.department_name
ORDER BY Employee_Count DESC
LIMIT 1;


-- =====================================================
-- 36. Department with Minimum Employees
-- =====================================================

SELECT
    d.department_name,
    COUNT(e.employee_id) AS Employee_Count
FROM departments d
JOIN employees e
ON d.department_id=e.department_id
GROUP BY d.department_name
ORDER BY Employee_Count
LIMIT 1;


-- =====================================================
-- 37. Employees Assigned to Each Project
-- =====================================================

SELECT
    p.project_name,
    COUNT(ep.employee_id) AS Employees_Assigned
FROM projects p
LEFT JOIN employee_projects ep
ON p.project_id=ep.project_id
GROUP BY p.project_name
ORDER BY Employees_Assigned DESC;


-- =====================================================
-- 38. Project Budget Per Employee
-- =====================================================

SELECT
    p.project_name,
    p.budget,
    COUNT(ep.employee_id) AS Employees_Assigned,
    ROUND(
        p.budget/
        NULLIF(COUNT(ep.employee_id),0),
        2
    ) AS Budget_Per_Employee
FROM projects p
LEFT JOIN employee_projects ep
ON p.project_id=ep.project_id
GROUP BY p.project_id,p.project_name,p.budget
ORDER BY Budget_Per_Employee DESC;


-- =====================================================
-- 39. Employees Not Working in Their Salary Range
-- =====================================================

SELECT
    e.employee_id,
    e.first_name,
    j.job_title,
    e.salary,
    j.minimum_salary,
    j.maximum_salary
FROM employees e
JOIN jobs j
ON e.job_id=j.job_id
WHERE e.salary<j.minimum_salary
OR e.salary>j.maximum_salary;


-- =====================================================
-- 40. Department Performance Dashboard
-- =====================================================

SELECT
    d.department_name,

    COUNT(e.employee_id) AS Total_Employees,

    ROUND(AVG(e.salary),2) AS Average_Salary,

    SUM(e.salary) AS Total_Salary,

    MAX(e.salary) AS Highest_Salary,

    MIN(e.salary) AS Lowest_Salary,

    COUNT(DISTINCT p.project_id) AS Total_Projects

FROM departments d

LEFT JOIN employees e
ON d.department_id=e.department_id

LEFT JOIN projects p
ON d.department_id=p.department_id

GROUP BY d.department_name

ORDER BY Total_Salary DESC;


-- =====================================================
-- 41. Executive KPI Dashboard
-- =====================================================

SELECT
    COUNT(*) AS Total_Employees,
    COUNT(DISTINCT department_id) AS Total_Departments,
    COUNT(DISTINCT job_id) AS Total_Job_Roles,
    ROUND(AVG(salary),2) AS Average_Salary,
    SUM(salary) AS Total_Payroll,
    MAX(salary) AS Highest_Salary,
    MIN(salary) AS Lowest_Salary
FROM employees;


-- =====================================================
-- 42. Salary Outliers (Above 1.5 × Company Average)
-- =====================================================

SELECT
    employee_id,
    first_name,
    last_name,
    salary
FROM employees
WHERE salary >
(
    SELECT AVG(salary) * 1.5
    FROM employees
)
ORDER BY salary DESC;


-- =====================================================
-- 43. Top 5 Departments by Payroll
-- =====================================================

SELECT
    d.department_name,
    SUM(e.salary) AS Payroll
FROM departments d
JOIN employees e
ON d.department_id = e.department_id
GROUP BY d.department_name
ORDER BY Payroll DESC
LIMIT 5;


-- =====================================================
-- 44. Employees Working on Multiple Projects
-- =====================================================

SELECT
    e.employee_id,
    e.first_name,
    e.last_name,
    COUNT(ep.project_id) AS Total_Projects
FROM employees e
JOIN employee_projects ep
ON e.employee_id = ep.employee_id
GROUP BY
    e.employee_id,
    e.first_name,
    e.last_name
HAVING COUNT(ep.project_id) > 1
ORDER BY Total_Projects DESC;


-- =====================================================
-- 45. Department Salary Gap
-- =====================================================

SELECT
    d.department_name,
    MAX(e.salary) AS Highest_Salary,
    MIN(e.salary) AS Lowest_Salary,
    MAX(e.salary)-MIN(e.salary) AS Salary_Gap
FROM employees e
JOIN departments d
ON e.department_id=d.department_id
GROUP BY d.department_name
ORDER BY Salary_Gap DESC;


-- =====================================================
-- 46. Employee Salary Compared to Department Average
-- =====================================================

SELECT
    employee_id,
    first_name,
    salary,
    department_id,
    ROUND(
        salary -
        AVG(salary) OVER(PARTITION BY department_id),
        2
    ) AS Difference_From_Department_Average
FROM employees
ORDER BY department_id;


-- =====================================================
-- 47. Department Salary Ranking
-- =====================================================

WITH DepartmentSalary AS
(
SELECT
    d.department_name,
    SUM(e.salary) AS Total_Salary
FROM departments d
JOIN employees e
ON d.department_id=e.department_id
GROUP BY d.department_name
)

SELECT *,
DENSE_RANK() OVER
(
ORDER BY Total_Salary DESC
) AS Payroll_Rank
FROM DepartmentSalary;


-- =====================================================
-- 48. Employee Experience Ranking
-- =====================================================

SELECT
    employee_id,
    first_name,
    hire_date,
    TIMESTAMPDIFF
    (
        YEAR,
        hire_date,
        CURDATE()
    ) AS Experience_Years,

    DENSE_RANK() OVER
    (
        ORDER BY
        TIMESTAMPDIFF
        (
            YEAR,
            hire_date,
            CURDATE()
        ) DESC
    ) AS Experience_Rank

FROM employees;


-- =====================================================
-- 49. Company Workforce Summary Report
-- =====================================================

SELECT

COUNT(*) AS Total_Employees,

COUNT(DISTINCT city) AS Total_Cities,

COUNT(DISTINCT department_id) AS Departments,

COUNT(DISTINCT job_id) AS Job_Roles,

ROUND(AVG(age),2) Average_Age,

ROUND(AVG(salary),2) Average_Salary,

SUM(salary) Payroll

FROM employees;


-- =====================================================
-- 50. Complete HR Executive Dashboard
-- =====================================================

SELECT

d.department_name,

COUNT(e.employee_id) Total_Employees,

ROUND(AVG(e.salary),2) Average_Salary,

SUM(e.salary) Total_Payroll,

MAX(e.salary) Highest_Salary,

MIN(e.salary) Lowest_Salary,

ROUND(AVG(e.age),1) Average_Age,

COUNT(DISTINCT p.project_id) Total_Projects,

ROUND(
SUM(e.salary)/
COUNT(e.employee_id),
2
) Payroll_Per_Employee

FROM departments d

LEFT JOIN employees e
ON d.department_id=e.department_id

LEFT JOIN projects p
ON d.department_id=p.department_id

GROUP BY d.department_name

ORDER BY Total_Payroll DESC;


/*
=========================================================

Employee Management System

Completed Successfully

=========================================================

Topics Covered

✓ SQL Basics

✓ Aggregate Functions

✓ GROUP BY

✓ HAVING

✓ Joins

✓ Subqueries

✓ CTE

✓ Window Functions

✓ Views

✓ Indexes

✓ Business Analytics

✓ HR Dashboard Queries

✓ Executive Reports

✓ Performance Optimization





