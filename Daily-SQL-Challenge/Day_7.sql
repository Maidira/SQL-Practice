CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    Name VARCHAR(100),
    Department VARCHAR(50),
    Salary DECIMAL(10, 2),
    HireDate DATE
);

INSERT INTO Employees (EmployeeID, Name, Department, Salary, HireDate) VALUES
(1, 'Alice', 'Engineering', 80000, '2021-03-10'),
(2, 'Bob', 'Engineering', 75000, '2022-01-20'),
(3, 'Charlie', 'Sales', 50000, '2023-02-15'),
(4, 'Diana', 'Sales', 55000, '2021-08-05'),
(5, 'Eve', 'HR', 60000, '2020-10-10'),
(6, 'Frank', 'HR', 62000, '2023-04-25'),
(7, 'Grace', 'Engineering', 78000, '2022-09-17'),
(8, 'Hank', 'Sales', 51000, '2023-03-14'),
(9, 'Ivy', 'Engineering', 83000, '2022-11-23');

CREATE TABLE Projects (
    ProjectID INT PRIMARY KEY,
    ProjectName VARCHAR(100),
    Department VARCHAR(50),
    StartDate DATE,
    Budget DECIMAL(12, 2)
);

INSERT INTO Projects (ProjectID, ProjectName, Department, StartDate, Budget) VALUES
(1, 'Project X', 'Engineering', '2022-01-01', 500000),
(2, 'Project Y', 'Sales', '2022-06-15', 300000),
(3, 'Project Z', 'HR', '2022-11-20', 200000),
(4, 'Project Alpha', 'Engineering', '2023-02-10', 800000),
(5, 'Project Beta', 'Sales', '2023-07-22', 250000),
(6, 'Project Gamma', 'HR', '2023-08-18', 100000);


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
(1, 4, 150),
(2, 1, 100),
(2, 4, 140),
(3, 2, 90),
(4, 2, 110),
(5, 3, 80),
(6, 3, 95),
(7, 1, 130),
(8, 5, 60),
(9, 4, 145);


-- Q1. Identify the top-earning employee in each department who worked on projects in 2023, based on their average hours worked across all projects.
WITH DepartmentHours AS (
    SELECT ep.EmployeeID, e.Department, AVG(ep.HoursWorked) AS AvgHours
    FROM EmployeeProjects ep
    JOIN Employees e ON ep.EmployeeID = e.EmployeeID
    JOIN Projects p ON ep.ProjectID = p.ProjectID
    WHERE YEAR(p.StartDate) = 2023
    GROUP BY ep.EmployeeID, e.Department
),
RankedEmployees AS (
    SELECT EmployeeID, Department, AvgHours,
           RANK() OVER (PARTITION BY Department ORDER BY AvgHours DESC) AS DeptRank
    FROM DepartmentHours
)
SELECT e.Name, d.Department, d.AvgHours
FROM RankedEmployees d
JOIN Employees e ON d.EmployeeID = e.EmployeeID
WHERE DeptRank = 1;


-- Q2. Calculate the running total of project budgets for each department, ordered by the project start date. Display department, project name, start date, budget, and the running total.
WITH DepartmentProjects AS (
    SELECT Department, ProjectName, StartDate, Budget
    FROM Projects
    WHERE YEAR(StartDate) = 2023
)
SELECT Department, ProjectName, StartDate, Budget,
       SUM(Budget) OVER (PARTITION BY Department ORDER BY StartDate) AS RunningBudgetTotal
FROM DepartmentProjects
ORDER BY Department, StartDate;
