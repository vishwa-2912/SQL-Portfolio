CREATE TABLE departments
(
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50),
    manager_name VARCHAR(100)
);


--jobs
CREATE TABLE jobs
(
    job_id INT PRIMARY KEY,
    job_title VARCHAR(50),
    minimum_salary DECIMAL(10,2),
    maximum_salary DECIMAL(10,2)
);

--employess
CREATE TABLE employees
(
    employee_id INT PRIMARY KEY,

    first_name VARCHAR(50),

    last_name VARCHAR(50),

    gender VARCHAR(10),

    age INT,

    city VARCHAR(50),

    hire_date DATE,

    salary DECIMAL(10,2),

    department_id INT,

    job_id INT,

    FOREIGN KEY(department_id)
    REFERENCES departments(department_id),


-projects
    CREATE TABLE projects
(
    project_id INT PRIMARY KEY,

    project_name VARCHAR(100),

    budget DECIMAL(12,2),

    department_id INT,

    FOREIGN KEY(department_id)
    REFERENCES departments(department_id)
);


-employee projects
    CREATE TABLE employee_projects
(
    employee_id INT,

    project_id INT,

    PRIMARY KEY(employee_id,project_id),

    FOREIGN KEY(employee_id)
    REFERENCES employees(employee_id),

    FOREIGN KEY(project_id)
    REFERENCES projects(project_id)
);



    FOREIGN KEY(job_id)
    REFERENCES jobs(job_id)
);
