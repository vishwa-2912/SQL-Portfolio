-- Employees working in IT and earning more than 60000

SELECT *
FROM employees
WHERE department = 'IT'
AND salary > 60000;



-- Employees working in IT or Finance

SELECT *
FROM employees
WHERE department = 'IT'
OR department = 'Finance';
