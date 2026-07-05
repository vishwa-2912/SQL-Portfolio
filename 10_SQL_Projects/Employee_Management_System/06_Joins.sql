/*
Business Question:
Display every employee along with their department.
*/

SELECT
    e.employee_id,
    e.first_name,
    e.last_name,
    d.department_name
FROM employees e
INNER JOIN departments d
ON e.department_id = d.department_id;

/*
Business Question:
Display employee names and their job titles.
*/

SELECT
    e.employee_id,
    e.first_name,
    e.last_name,
    j.job_title
FROM employees e
INNER JOIN jobs j
ON e.job_id = j.job_id;
/*
Business Question:
Display employee, department and job title.
*/

SELECT
    e.employee_id,
    e.first_name,
    e.last_name,
    d.department_name,
    j.job_title,
    e.salary
FROM employees e
JOIN departments d
ON e.department_id = d.department_id
JOIN jobs j
ON e.job_id = j.job_id;

/*
Business Question:
Display employees and the projects they are working on.
*/

SELECT
    e.first_name,
    e.last_name,
    p.project_name
FROM employees e
JOIN employee_projects ep
ON e.employee_id = ep.employee_id
JOIN projects p
ON ep.project_id = p.project_id;

/*
Business Question:
Display project name with department.
*/

SELECT
    p.project_name,
    d.department_name,
    p.budget
FROM projects p
JOIN departments d
ON p.department_id = d.department_id;

/*
Business Question:
Find employees not assigned to any project.
*/

SELECT
    e.employee_id,
    e.first_name,
    e.last_name
FROM employees e
LEFT JOIN employee_projects ep
ON e.employee_id = ep.employee_id
WHERE ep.project_id IS NULL;

/*
Business Question:
Find departments with no projects.
*/

SELECT
    d.department_name
FROM departments d
LEFT JOIN projects p
ON d.department_id = p.department_id
WHERE p.project_id IS NULL;

/*
Business Question:
Display employee and their department manager.
*/

SELECT
    e.first_name,
    e.last_name,
    d.department_name,
    d.manager_name
FROM employees e
JOIN departments d
ON e.department_id = d.department_id;

/*
Business Question:
Display all employees in the IT department.
*/

SELECT
    e.first_name,
    e.last_name,
    d.department_name
FROM employees e
JOIN departments d
ON e.department_id = d.department_id
WHERE d.department_name = 'IT';

/*
Business Question:
Display employees working on AI Research.
*/

SELECT
    e.first_name,
    e.last_name,
    p.project_name
FROM employees e
JOIN employee_projects ep
ON e.employee_id = ep.employee_id
JOIN projects p
ON ep.project_id = p.project_id
WHERE p.project_name = 'AI Research';

/*
Business Question:
Count employees in each department.
*/

SELECT
    d.department_name,
    COUNT(e.employee_id) AS Total_Employees
FROM departments d
LEFT JOIN employees e
ON d.department_id = e.department_id
GROUP BY d.department_name;

/*
Business Question:
Calculate total salary expense by department.
*/

SELECT
    d.department_name,
    SUM(e.salary) AS Total_Salary
FROM departments d
JOIN employees e
ON d.department_id = e.department_id
GROUP BY d.department_name;

/*
Business Question:
Average salary for each job.
*/

SELECT
    j.job_title,
    ROUND(AVG(e.salary),2) AS Average_Salary
FROM jobs j
JOIN employees e
ON j.job_id = e.job_id
GROUP BY j.job_title;

/*
Business Question:
Highest salary by department.
*/

SELECT
    d.department_name,
    MAX(e.salary) AS Highest_Salary
FROM departments d
JOIN employees e
ON d.department_id = e.department_id
GROUP BY d.department_name;

/*
Business Question:
Display total project budget by department.
*/

SELECT
    d.department_name,
    SUM(p.budget) AS Total_Budget
FROM departments d
JOIN projects p
ON d.department_id = p.department_id
GROUP BY d.department_name;


/*
Business Question:
Display employees from London and their department.
*/

SELECT
    e.first_name,
    e.last_name,
    d.department_name
FROM employees e
JOIN departments d
ON e.department_id = d.department_id
WHERE e.city = 'London';

/*
Business Question:
Count projects assigned to each employee.
*/

SELECT
    e.first_name,
    e.last_name,
    COUNT(ep.project_id) AS Total_Projects
FROM employees e
LEFT JOIN employee_projects ep
ON e.employee_id = ep.employee_id
GROUP BY e.employee_id, e.first_name, e.last_name;

/*
Business Question:
Display department manager and number of employees.
*/

SELECT
    d.manager_name,
    d.department_name,
    COUNT(e.employee_id) AS Employees
FROM departments d
LEFT JOIN employees e
ON d.department_id = e.department_id
GROUP BY d.department_id, d.manager_name, d.department_name;


/*
Business Question:
Display employees earning more than £70,000.
*/

SELECT
    e.first_name,
    e.last_name,
    d.department_name,
    j.job_title,
    e.salary
FROM employees e
JOIN departments d
ON e.department_id = d.department_id
JOIN jobs j
ON e.job_id = j.job_id
WHERE e.salary > 70000;


/*
Business Question:
Generate a complete employee report.
*/

SELECT
    e.employee_id,
    e.first_name,
    e.last_name,
    e.gender,
    e.age,
    e.city,
    d.department_name,
    j.job_title,
    e.salary,
    p.project_name
FROM employees e
LEFT JOIN departments d
ON e.department_id = d.department_id
LEFT JOIN jobs j
ON e.job_id = j.job_id
LEFT JOIN employee_projects ep
ON e.employee_id = ep.employee_id
LEFT JOIN projects p
ON ep.project_id = p.project_id
ORDER BY e.employee_id;



