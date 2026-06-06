CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    Name VARCHAR(100),
    Position VARCHAR(50),
    Salary DECIMAL(10, 2),
    Department VARCHAR(50),
    HireDate DATE
);

INSERT INTO Employees (EmployeeID, Name, Position, Salary, Department, HireDate) VALUES
(1, 'Alice', 'Manager', 85000, 'Sales', '2021-03-12'),
(2, 'Bob', 'Analyst', 56000, 'Sales', '2022-04-18'),
(3, 'Charlie', 'Executive', 48000, 'Marketing', '2020-06-24'),
(4, 'Diana', 'Manager', 87000, 'Marketing', '2019-07-15'),
(5, 'Edward', 'Analyst', 62000, 'Finance', '2023-01-10'),
(6, 'Fiona', 'Clerk', 35000, 'Finance', '2022-08-03'),
(7, 'George', 'Executive', 53000, 'Operations', '2020-11-29'),
(8, 'Hannah', 'Clerk', 36000, 'Sales', '2023-02-22'),
(9, 'Ivan', 'Manager', 90000, 'Operations', '2021-09-16'),
(10, 'Jane', 'Analyst', 57000, 'Marketing', '2023-03-05');

CREATE TABLE Projects (
    ProjectID INT PRIMARY KEY,
    ProjectName VARCHAR(100),
    StartDate DATE,
    EndDate DATE,
    Department VARCHAR(50)
);

INSERT INTO Projects (ProjectID, ProjectName, StartDate, EndDate, Department) VALUES
(1, 'Product Launch', '2023-01-01', '2023-06-30', 'Marketing'),
(2, 'Sales Strategy', '2023-02-15', '2023-07-31', 'Sales'),
(3, 'Finance Review', '2023-03-10', '2023-09-10', 'Finance'),
(4, 'Operational Efficiency', '2023-04-01', '2023-12-31', 'Operations'),
(5, 'Market Research', '2023-05-15', '2023-10-15', 'Marketing');

CREATE TABLE EmployeeProjects (
    EmployeeID INT,
    ProjectID INT,
    PRIMARY KEY (EmployeeID, ProjectID),
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID),
    FOREIGN KEY (ProjectID) REFERENCES Projects(ProjectID)
);

INSERT INTO EmployeeProjects (EmployeeID, ProjectID) VALUES
(1, 1),
(1, 2),
(2, 2),
(3, 1),
(4, 5),
(5, 3),
(6, 3),
(7, 4),
(8, 2),
(9, 4),
(10, 1),
(10, 5);


-- Q1. Identify employees who participated in more than one project in the same department in 2023. Display their name, department, and the number of projects they were part of in that department.
WITH departmentProject AS (
	SELECT 
		  ep.employeeid, 
      p.department,
      COUNT(DISTINCT ep.projectid) AS projectNumber
	FROM employeeProjects ep
  JOIN projects p
    ON ep.projectid = p.projectid
   WHERE YEAR(p.startdate) = 2023
  GROUP BY 
      ep.employeeid, 
      p.department
)

SELECT 
	e.name,
    dp.department,
    dp.projectNumber
FROM departmentProject dp
JOIN employees e
ON dp.employeeid = e.employeeid
WHERE dp.projectNumber > 1;


-- Q2. For each department, find the highest-paid employee along with their name, position, and salary. If there are ties, display all employees with the top salary.
WITH DepartmentSalaries AS (
    SELECT 
        Department, 
        Name, 
        Position,
        Salary,
        RANK() OVER (PARTITION BY Department ORDER BY Salary DESC) AS SalaryRank
    FROM Employees
)
SELECT 
    Department, 
    Name, 
    Position, 
    Salary
FROM DepartmentSalaries
WHERE SalaryRank = 1;


-- Q3. Calculate the average project duration (in days) for each department for projects that ended in 2023. Show the department name, average duration, and count of projects included.
WITH ProjectDurations AS (
    SELECT 
        Department,
        DATEDIFF(EndDate, StartDate) AS Duration
    FROM Projects
    WHERE YEAR(EndDate) = 2023
)
SELECT 
  Department, AVG(Duration) AS AvgProjectDuration, 
  COUNT(*) AS ProjectCount
FROM ProjectDurations
GROUP BY Department;
