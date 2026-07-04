-- Employees whose first name starts with J

SELECT *
FROM employees
WHERE first_name LIKE 'J%';


-- Employees whose first name ends with 'a'

SELECT *
FROM employees
WHERE first_name LIKE '%a';

-- Employees whose last name contains 'son'

SELECT *
FROM employees
WHERE last_name LIKE '%son%';
