/*
=========================================================
Employee Management System
11_Indexes.sql
Author: Vishwa
Description: SQL Indexes for Performance Optimization
=========================================================
*/

-- =====================================================
-- WHAT IS AN INDEX?
-- =====================================================

/*
An INDEX is a database object that improves the speed
of SELECT queries.

Without Index:
Database scans every row.

With Index:
Database directly locates the required rows.

Advantages:
✓ Faster Searching
✓ Faster Filtering
✓ Faster Joins
✓ Faster Sorting

Disadvantages:
✗ Slightly slower INSERT
✗ Slightly slower UPDATE
✗ Slightly slower DELETE
✗ Uses extra storage
*/

-- =====================================================
-- 1. Create Index on Employee ID
-- =====================================================

CREATE INDEX idx_employee_id
ON employees(employee_id);

-- Test Query

SELECT *
FROM employees
WHERE employee_id = 1005;

-- =====================================================
-- 2. Create Index on Department ID
-- =====================================================

CREATE INDEX idx_department
ON employees(department_id);

SELECT *
FROM employees
WHERE department_id = 1;

-- =====================================================
-- 3. Create Index on Job ID
-- =====================================================

CREATE INDEX idx_job
ON employees(job_id);

SELECT *
FROM employees
WHERE job_id = 101;

-- =====================================================
-- 4. Create Index on Salary
-- =====================================================

CREATE INDEX idx_salary
ON employees(salary);

SELECT *
FROM employees
WHERE salary > 70000;

-- =====================================================
-- 5. Create Index on Hire Date
-- =====================================================

CREATE INDEX idx_hire_date
ON employees(hire_date);

SELECT *
FROM employees
WHERE hire_date > '2022-01-01';

-- =====================================================
-- 6. Create Index on City
-- =====================================================

CREATE INDEX idx_city
ON employees(city);

SELECT *
FROM employees
WHERE city='London';

-- =====================================================
-- 7. Composite Index
-- =====================================================

CREATE INDEX idx_department_salary
ON employees(department_id,salary);

SELECT *
FROM employees
WHERE department_id=1
AND salary>60000;

-- =====================================================
-- 8. Composite Index
-- =====================================================

CREATE INDEX idx_city_department
ON employees(city,department_id);

SELECT *
FROM employees
WHERE city='London'
AND department_id=1;

-- =====================================================
-- 9. Unique Index
-- =====================================================

CREATE UNIQUE INDEX idx_department_name
ON departments(department_name);

SELECT *
FROM departments;

-- =====================================================
-- 10. Index on Project Name
-- =====================================================

CREATE INDEX idx_project_name
ON projects(project_name);

SELECT *
FROM projects
WHERE project_name='AI Research';

-- =====================================================
-- SHOW INDEXES
-- =====================================================

SHOW INDEXES FROM employees;

SHOW INDEXES FROM departments;

SHOW INDEXES FROM projects;

-- =====================================================
-- EXPLAIN QUERY
-- =====================================================

/*
EXPLAIN shows how MySQL executes a query.
It helps verify whether an index is being used.
*/

EXPLAIN
SELECT *
FROM employees
WHERE department_id=1;

EXPLAIN
SELECT *
FROM employees
WHERE salary>70000;

EXPLAIN
SELECT *
FROM employees
WHERE city='London';

-- =====================================================
-- DROP INDEX
-- =====================================================

/*
Syntax:

DROP INDEX index_name
ON table_name;
*/

-- Example

-- DROP INDEX idx_salary ON employees;

-- =====================================================
-- WHEN SHOULD YOU CREATE INDEXES?
-- =====================================================

/*

Create indexes on:

✓ Primary Keys
✓ Foreign Keys
✓ Frequently searched columns
✓ JOIN columns
✓ ORDER BY columns
✓ GROUP BY columns
✓ WHERE clause columns

Examples

employee_id

department_id

job_id

salary

hire_date

city

project_name

*/

-- =====================================================
-- WHEN NOT TO CREATE INDEXES?
-- =====================================================

/*

Avoid indexes on:

✗ Small Tables

✗ Columns with very few unique values
Example:
Gender

Only Male/Female

✗ Frequently updated columns

*/

-- =====================================================
-- INTERVIEW QUESTIONS
-- =====================================================

/*

Q1 What is an Index?

Q2 Why Indexes are used?

Q3 Difference between Clustered and Non-Clustered Index?

Q4 What is Composite Index?

Q5 What is Unique Index?

Q6 Can Index speed up INSERT?

Answer:
No
It slows INSERT slightly.

Q7 Which command checks Index usage?

Answer:
EXPLAIN

Q8 How to delete an Index?

DROP INDEX

*/

-- =====================================================
-- END OF FILE
==========================================================

Topics Covered

✓ CREATE INDEX

✓ UNIQUE INDEX

✓ COMPOSITE INDEX

✓ EXPLAIN

✓ SHOW INDEXES

✓ DROP INDEX

✓ Performance Optimization

✓ SQL Interview Questions

Total Examples : 10

=========================================================
