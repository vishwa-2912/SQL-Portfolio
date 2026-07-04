-- HAVING
-- Display departments whose average salary is greater than 50000.

SELECT
    department,
    AVG(salary) AS Average_Salary
FROM employees
GROUP BY department
HAVING AVG(salary) > 50000;

-- Sample Output

-- Department   Average_Salary
-- Finance      80000
-- IT           60000
