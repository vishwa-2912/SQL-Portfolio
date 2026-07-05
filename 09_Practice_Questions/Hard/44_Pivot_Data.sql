/*
Question:
Count employees in each department using a pivot-style query.
*/

SELECT
    SUM(CASE WHEN department_id = 1 THEN 1 ELSE 0 END) AS IT,
    SUM(CASE WHEN department_id = 2 THEN 1 ELSE 0 END) AS HR,
    SUM(CASE WHEN department_id = 3 THEN 1 ELSE 0 END) AS Finance,
    SUM(CASE WHEN department_id = 4 THEN 1 ELSE 0 END) AS Sales
FROM employees;
