

-- Business Question 1
-- How many employees does the company have?

SELECT COUNT(*) AS Total_Employees
FROM employees;

-- Business Question 2
-- What is the average employee salary?

SELECT ROUND(AVG(salary),2) AS Average_Salary
FROM employees;


-- Business Question 3
-- Who is the highest-paid employee?

SELECT *
FROM employees
ORDER BY salary DESC
LIMIT 1;

-- Business Question 4 Highest Paid Employees

SELECT
employee_id,
first_name,
last_name,
salary
FROM employees
ORDER BY salary DESC
LIMIT 5;


-- Business Question 5Lowest Paid Employee


SELECT *
FROM employees
ORDER BY salary
LIMIT 1;

--Business Question Salary  Department


SELECT
d.department_name,
SUM(e.salary) AS Total_Salary
FROM employees e
JOIN departments d
ON e.department_id=d.department_id
GROUP BY d.department_name
ORDER BY Total_Salary DESC;

-- Business Question 7Average Salary by Department

SELECT
d.department_name,
ROUND(AVG(e.salary),2) AS Average_Salary
FROM employees e
JOIN departments d
ON e.department_id=d.department_id
GROUP BY d.department_name
ORDER BY Average_Salary DESC;

-- Business Question 8 Number of Employees per Department

SELECT
d.department_name,
COUNT(*) AS Employees
FROM employees e
JOIN departments d
ON e.department_id=d.department_id
GROUP BY d.department_name;

-- Business Question 9 Department with Highest Average Salary

SELECT
d.department_name,
AVG(e.salary) AS AvgSalary
FROM employees e
JOIN departments d
ON e.department_id=d.department_id
GROUP BY d.department_name
ORDER BY AvgSalary DESC
LIMIT 1;


-- Business Question 10 Employees Above Company Average

SELECT *
FROM employees
WHERE salary >
(
SELECT AVG(salary)
FROM employees
);

-- Business Question 11 Employees Without Projects

SELECT
e.employee_id,
e.first_name,
e.last_name
FROM employees e
LEFT JOIN employee_projects ep
ON e.employee_id=ep.employee_id
WHERE ep.project_id IS NULL;

-- Business Question 12 Number of Employees per City

SELECT
city,
COUNT(*) AS Employees
FROM employees
GROUP BY city
ORDER BY Employees DESC;

-- Business Question 13Employees Hired After 2022

SELECT *
FROM employees
WHERE hire_date>'2022-01-01';

-- Business Question 14 Total Project Budget

SELECT SUM(budget) AS Total_Budget
FROM projects;

-- Business Question 15 Highest Budget Project

SELECT *
FROM projects
ORDER BY budget DESC
LIMIT 1;
