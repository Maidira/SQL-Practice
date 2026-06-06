CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50),
    Location VARCHAR(50)
);

INSERT INTO Departments (DepartmentID, DepartmentName, Location) VALUES
(1, 'Engineering', 'New York'),
(2, 'HR', 'Chicago'),
(3, 'Marketing', 'San Francisco'),
(4, 'Finance', 'New York'),
(5, 'Operations', 'Chicago');


CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    Name VARCHAR(50),
    DepartmentID INT,
    Salary DECIMAL(10, 2),
    HireDate DATE,
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);

INSERT INTO Employees (EmployeeID, Name, DepartmentID, Salary, HireDate) VALUES
(1, 'Alice', 1, 70000, '2021-05-15'),
(2, 'Bob', 1, 80000, '2023-01-10'),
(3, 'Charlie', 2, 60000, '2022-09-01'),
(4, 'David', 2, 50000, '2023-03-15'),
(5, 'Eve', 3, 55000, '2022-08-20'),
(6, 'Frank', 4, 75000, '2023-07-01'),
(7, 'Grace', 5, 62000, '2023-06-10');


CREATE TABLE Projects (
    ProjectID INT PRIMARY KEY,
    ProjectName VARCHAR(50),
    StartDate DATE,
    EndDate DATE,
    Budget DECIMAL(12, 2)
);

INSERT INTO Projects (ProjectID, ProjectName, StartDate, EndDate, Budget) VALUES
(1, 'Project Alpha', '2023-01-01', '2023-06-01', 500000),
(2, 'Project Beta', '2023-02-01', '2023-07-01', 750000),
(3, 'Project Gamma', '2023-03-01', '2023-09-01', 600000),
(4, 'Project Delta', '2022-05-01', '2022-11-01', 450000),
(5, 'Project Epsilon', '2023-04-01', '2023-10-01', 800000);

CREATE TABLE EmployeeProjects (
    EmployeeID INT,
    ProjectID INT,
    HoursWorked INT,
    PRIMARY KEY (EmployeeID, ProjectID),
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID),
    FOREIGN KEY (ProjectID) REFERENCES Projects(ProjectID)
);

INSERT INTO EmployeeProjects (EmployeeID, ProjectID, HoursWorked) VALUES
(1, 1, 120),
(1, 2, 200),
(1, 3, 150),
(2, 2, 180),
(2, 3, 160),
(2, 5, 210),
(3, 4, 90),
(4, 1, 100),
(4, 5, 190),
(5, 2, 130),
(5, 3, 140),
(6, 3, 115),
(6, 5, 200),
(7, 4, 170);



-- Q1. Find the names of employees who have worked on projects with a total budget of over $1,000,000 in 2023.
SELECT e.name
FROM Employees e 
JOIN EmployeeProjects ep
ON e.employeeid = ep.employeeid
JOIN Projects p
ON ep.projectid = p.projectid
WHERE Year(p.startdate) = 2023
GROUP BY e.name
HAVING SUM(p.budget) > 1000000;


-- Q2. List the names of departments along with the average salary of employees hired after January 1, 2023, if the average salary is higher than the overall average salary of the company.
SELECT 
  d.departmentName,
	AVG(e.salary) AS avg_salary
FROM departments d
JOIN employees e
ON d.departmentid = e.departmentid
WHERE hiredate > '2023-01-01'
GROUP BY d.departmentname
HAVING AVG(e.salary) > 
	(SELECT AVG(salary)
	FROM employees);

-- Q3. Retrieve the names of employees who have worked more than 150 hours on any single project and whose department is located in Chicago.
SELECT e.Name
FROM Employees e
JOIN EmployeeProjects ep 
ON e.EmployeeID = ep.EmployeeID
JOIN Departments d 
ON e.DepartmentID = d.DepartmentID
WHERE 
  d.Location = 'Chicago' 
  AND 
  ep.HoursWorked > 150
GROUP BY e.EmployeeID, e.Name;
