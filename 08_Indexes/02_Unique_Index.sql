-- Unique Index
-- Prevent duplicate email addresses.

-- First add an email column if it doesn't exist.

ALTER TABLE employees
ADD COLUMN email VARCHAR(100);

CREATE UNIQUE INDEX idx_email
ON employees(email);

-- Every email must be unique.
