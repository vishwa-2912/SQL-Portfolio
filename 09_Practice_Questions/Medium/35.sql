/*
Question:
Display employees living in the same city.
*/

SELECT
    A.first_name AS Employee1,
    B.first_name AS Employee2,
    A.city
FROM employees A
JOIN employees B
ON A.city=B.city
AND A.emp_id<B.emp_id;
