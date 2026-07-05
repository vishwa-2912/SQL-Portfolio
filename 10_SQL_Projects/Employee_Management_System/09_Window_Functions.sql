/*
=========================================================
Employee Management System
09_Window_Functions.sql
Author: Vishwa
Description: Business Questions using SQL Window Functions
=========================================================
*/

-- =====================================================
-- 1. ROW_NUMBER() - Assign Row Number
-- =====================================================

SELECT
    employee_id,
    first_name,
    salary,
    ROW_NUMBER() OVER(ORDER BY salary DESC) AS Row_Num
FROM employees;

-- =====================================================
-- 2. RANK() - Rank Employees by Salary
-- =====================================================

SELECT
    employee_id,
    first_name,
    salary,
    RANK() OVER(ORDER BY salary DESC) AS Salary_Rank
FROM employees;

-- =====================================================
-- 3. DENSE_RANK() - Dense Ranking
-- =====================================================

SELECT
    employee_id,
    first_name,
    salary,
    DENSE_RANK() OVER(ORDER BY salary DESC) AS Dense_Rank
FROM employees;

-- =====================================================
-- 4. Top 3 Highest Paid Employees
-- =====================================================

WITH SalaryRank AS
(
SELECT *,
DENSE_RANK() OVER(ORDER BY salary DESC) Rank_No
FROM employees
)

SELECT *
FROM SalaryRank
WHERE Rank_No<=3;

-- =====================================================
-- 5. Highest Paid Employee in Each Department
-- =====================================================

WITH DepartmentRank AS
(
SELECT *,
ROW_NUMBER() OVER(PARTITION BY department_id ORDER BY salary DESC) RN
FROM employees
)

SELECT *
FROM DepartmentRank
WHERE RN=1;

-- =====================================================
-- 6. Top 2 Employees in Each Department
-- =====================================================

WITH DepartmentRank AS
(
SELECT *,
ROW_NUMBER() OVER(PARTITION BY department_id ORDER BY salary DESC) RN
FROM employees
)

SELECT *
FROM DepartmentRank
WHERE RN<=2;

-- =====================================================
-- 7. Lowest Paid Employee in Each Department
-- =====================================================

WITH DepartmentRank AS
(
SELECT *,
ROW_NUMBER() OVER(PARTITION BY department_id ORDER BY salary ASC) RN
FROM employees
)

SELECT *
FROM DepartmentRank
WHERE RN=1;

-- =====================================================
-- 8. Running Total Salary
-- =====================================================

SELECT
employee_id,
first_name,
salary,
SUM(salary) OVER(ORDER BY employee_id) AS Running_Total
FROM employees;

-- =====================================================
-- 9. Running Average Salary
-- =====================================================

SELECT
employee_id,
first_name,
salary,
AVG(salary) OVER(ORDER BY employee_id) AS Running_Average
FROM employees;

-- =====================================================
-- 10. Total Salary of Company on Every Row
-- =====================================================

SELECT
employee_id,
first_name,
salary,
SUM(salary) OVER() AS Company_Total_Salary
FROM employees;

-- =====================================================
-- 11. Average Salary of Company on Every Row
-- =====================================================

SELECT
employee_id,
first_name,
salary,
AVG(salary) OVER() AS Company_Average
FROM employees;

-- =====================================================
-- 12. Department Wise Total Salary
-- =====================================================

SELECT
employee_id,
department_id,
salary,
SUM(salary) OVER(PARTITION BY department_id) Department_Total
FROM employees;

-- =====================================================
-- 13. Department Wise Average Salary
-- =====================================================

SELECT
employee_id,
department_id,
salary,
AVG(salary) OVER(PARTITION BY department_id) Department_Average
FROM employees;

-- =====================================================
-- 14. LAG() Previous Employee Salary
-- =====================================================

SELECT
employee_id,
first_name,
salary,
LAG(salary) OVER(ORDER BY employee_id) Previous_Salary
FROM employees;

-- =====================================================
-- 15. LEAD() Next Employee Salary
-- =====================================================

SELECT
employee_id,
first_name,
salary,
LEAD(salary) OVER(ORDER BY employee_id) Next_Salary
FROM employees;

-- =====================================================
-- 16. Salary Difference from Previous Employee
-- =====================================================

SELECT
employee_id,
first_name,
salary,
salary-
LAG(salary) OVER(ORDER BY employee_id)
AS Salary_Difference
FROM employees;

-- =====================================================
-- 17. FIRST_VALUE()
-- =====================================================

SELECT
employee_id,
department_id,
salary,
FIRST_VALUE(salary)
OVER(PARTITION BY department_id ORDER BY salary DESC)
Highest_Department_Salary
FROM employees;

-- =====================================================
-- 18. LAST_VALUE()
-- =====================================================

SELECT
employee_id,
department_id,
salary,
LAST_VALUE(salary)
OVER(
PARTITION BY department_id
ORDER BY salary
ROWS BETWEEN UNBOUNDED PRECEDING
AND UNBOUNDED FOLLOWING
)
Lowest_Department_Salary
FROM employees;

-- =====================================================
-- 19. NTILE() Quartiles
-- =====================================================

SELECT
employee_id,
first_name,
salary,
NTILE(4)
OVER(ORDER BY salary DESC)
Salary_Quartile
FROM employees;

-- =====================================================
-- 20. Percent Rank
-- =====================================================

SELECT
employee_id,
salary,
PERCENT_RANK()
OVER(ORDER BY salary)
Percent_Rank
FROM employees;

-- =====================================================
-- 21. Cumulative Department Salary
-- =====================================================

SELECT
employee_id,
department_id,
salary,
SUM(salary)
OVER(
PARTITION BY department_id
ORDER BY employee_id
)
Running_Department_Salary
FROM employees;

-- =====================================================
-- 22. Employee Salary Percentage of Company Salary
-- =====================================================

SELECT
employee_id,
first_name,
salary,
ROUND(
salary*100/
SUM(salary) OVER(),
2
) AS Salary_Percentage
FROM employees;

-- =====================================================
-- 23. Rank Employees by Age
-- =====================================================

SELECT
employee_id,
first_name,
age,
RANK() OVER(ORDER BY age DESC)
Age_Rank
FROM employees;

-- =====================================================
-- 24. Rank Employees by Hire Date
-- =====================================================

SELECT
employee_id,
first_name,
hire_date,
ROW_NUMBER()
OVER(ORDER BY hire_date)
Joining_Order
FROM employees;

-- =====================================================
-- 25. Complete Employee Analytics Report
-- =====================================================

SELECT
employee_id,
first_name,
department_id,
salary,

ROW_NUMBER()
OVER(ORDER BY salary DESC) AS Row_Number,

RANK()
OVER(ORDER BY salary DESC) AS Salary_Rank,

DENSE_RANK()
OVER(ORDER BY salary DESC) AS Dense_Rank,

SUM(salary)
OVER() AS Company_Salary,

AVG(salary)
OVER(PARTITION BY department_id)
AS Department_Average,

LAG(salary)
OVER(ORDER BY employee_id)
AS Previous_Salary,

LEAD(salary)
OVER(ORDER BY employee_id)
AS Next_Salary

FROM employees;

/*
=========================================================
END OF FILE
=========================================================

Topics Covered

✓ ROW_NUMBER()

✓ RANK()

✓ DENSE_RANK()

✓ LAG()

✓ LEAD()

✓ FIRST_VALUE()

✓ LAST_VALUE()

✓ NTILE()

✓ PERCENT_RANK()

✓ PARTITION BY

✓ Running Total

✓ Running Average

✓ Salary Analytics

✓ Department Analytics

✓ HR Dashboard Queries

Total Business Questions : 25

=========================================================
