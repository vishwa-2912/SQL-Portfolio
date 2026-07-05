-- Interview Question 1
-- Find the second highest salary.

SELECT *
FROM
(
    SELECT
        first_name,
        salary,
        DENSE_RANK() OVER(ORDER BY salary DESC) AS rnk
    FROM employees
) AS RankedEmployees
WHERE rnk = 2;

-----------------------------------------------------

-- Interview Question 2
-- Highest paid employee in each department.

SELECT *
FROM
(
    SELECT
        first_name,
        department_id,
        salary,
        ROW_NUMBER() OVER(
            PARTITION BY department_id
            ORDER BY salary DESC
        ) AS rn
    FROM employees
) AS DepartmentRanking
WHERE rn = 1;

-----------------------------------------------------

-- Interview Question 3
-- Compare each employee's salary with the previous employee.

SELECT
    first_name,
    salary,
    LAG(salary) OVER(ORDER BY salary) AS Previous_Salary
FROM employees;
