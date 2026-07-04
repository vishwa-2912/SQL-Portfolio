-- GROUP BY
-- Display the average salary for each department.

SELECT
    department,
    AVG(salary) AS Average_Salary
FROM employees
GROUP BY department;

-- Sample Output

-- Department   Average_Salary
-- Finance      80000
-- HR           46000
-- IT           60000
-- Sales        41000
