-- Create Employees Table

CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    age INT,
    department_id INT,
    salary DECIMAL(10,2),
    city VARCHAR(50)
);
