-- Interview Question 1
-- Find the second highest salary.

SELECT MAX(salary) AS Second_Highest_Salary
FROM employees
WHERE salary <
(
    SELECT MAX(salary)
    FROM employees
);

--------------------------------------------------

-- Interview Question 2
-- Find employees earning the maximum salary.

SELECT *
FROM employees
WHERE salary =
(
    SELECT MAX(salary)
    FROM employees
);

--------------------------------------------------

-- Interview Question 3
-- Find employees earning below the average salary.

SELECT *
FROM employees
WHERE salary <
(
    SELECT AVG(salary)
    FROM employees
);
