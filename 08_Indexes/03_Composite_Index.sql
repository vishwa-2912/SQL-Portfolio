-- Composite Index
-- Create an index using department_id and salary.

CREATE INDEX idx_department_salary
ON employees(department_id, salary);

-- Useful when filtering by both department and salary.
