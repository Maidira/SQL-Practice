CREATE TABLE employees (
    employee_id INT,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    dept_id VARCHAR(100),
    manager_id INT,
    salary INT,
    expertise VARCHAR(100)
);

INSERT INTO employees (employee_id, first_name, last_name, dept_id, manager_id, salary, expertise) VALUES
(100, 'John', 'White', 'IT', 103, 120000, 'Senior'),
(101, 'Mary', 'Danner', 'Account', 109, 80000, 'Junior'),
(102, 'Ann', 'Lynn', 'Sales', 107, 140000, 'Semisenior'),
(103, 'Peter', 'O''connor', 'IT', 110, 130000, 'Senior'),
(106, 'Sue', 'Sanchez', 'Sales', 107, 110000, 'Junior'),
(107, 'Marta', 'Doe', 'Sales', 110, 180000, 'Senior'),
(109, 'Ann', 'Danner', 'Account', 110, 90000, 'Senior'),
(110, 'Simon', 'Yang', 'CEO', NULL, 250000, 'Senior'),
(111, 'Juan', 'Graue', 'Sales', 102, 37000, 'Junior');


-- Q1. Write an SQL query showing the department ID and the employee name with the second highest salary in this department. We want one record for each department in the company.
WITH employee_ranking AS (
  SELECT
    employee_id,
    last_name,
    first_name,
    salary,
    dept_id,
    RANK() OVER (PARTITION BY dept_id ORDER BY salary DESC) as ranking
  FROM employees
)
SELECT
  dept_id,
  employee_id,
  last_name,
  first_name,
  salary
FROM employee_ranking
WHERE ranking = 2
ORDER BY dept_id, last_name;


-- Q2. Write an SQL query to find the total sum of salaries for each department and the total sum of salaries for the all employees.
SELECT 
    dept_id, 
    expertise, 
    SUM(salary) AS total_salary 
FROM 
    employees 
GROUP BY 
    dept_id, 
    expertise WITH ROLLUP;
