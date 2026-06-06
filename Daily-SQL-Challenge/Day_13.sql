CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(100),
    Location VARCHAR(50)
);

INSERT INTO Departments (DepartmentID, DepartmentName, Location) VALUES
(1, 'Sales', 'New York'),
(2, 'Engineering', 'San Francisco'),
(3, 'Human Resources', 'Chicago'),
(4, 'Marketing', 'Los Angeles'),
(5, 'Finance', 'New York');

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    EmployeeName VARCHAR(100),
    Salary DECIMAL(10, 2),
    HireDate DATE,
    DepartmentID INT,
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);

INSERT INTO Employees (EmployeeID, EmployeeName, Salary, HireDate, DepartmentID) VALUES
(1, 'Alice Johnson', 75000, '2019-06-10', 1),
(2, 'Bob Smith', 85000, '2020-07-15', 2),
(3, 'Carol White', 67000, '2021-08-20', 3),
(4, 'David Brown', 93000, '2018-05-22', 2),
(5, 'Eve Davis', 79000, '2019-04-10', 1),
(6, 'Frank Wilson', 88000, '2021-09-30', 4),
(7, 'Grace Lee', 72000, '2022-01-10', 3),
(8, 'Henry Clark', 96000, '2020-02-01', 5),
(9, 'Ivy Baker', 60000, '2023-03-15', 4),
(10, 'Jack Hall', 82000, '2022-05-20', 5);


-- Q1. Rank employees by salary within each department. Display the employee name, department, salary, and their rank within the department.
SELECT e.EmployeeName, 
      d.DepartmentName, 
      e.Salary,
      ROW_NUMBER() OVER (PARTITION BY d.DepartmentID ORDER BY e.Salary DESC) AS SalaryRank
FROM Employees e
JOIN Departments d 
      ON e.DepartmentID = d.DepartmentID;


-- Q2. Divide employees into four salary quartiles across the company and display the employee name, salary, quartile, and department name.
SELECT e.EmployeeName, 
      e.Salary, 
      NTILE(4) OVER (ORDER BY e.Salary DESC) AS SalaryQuartile,
      d.DepartmentName
FROM Employees e
JOIN Departments d 
      ON e.DepartmentID = d.DepartmentID;


-- Q3. For each employee, display their name, department, hire date, and the difference in months between their hire date and the next most recent hire date within the same department.
WITH HireDates AS (
    SELECT e.EmployeeID, 
            e.EmployeeName, 
            d.DepartmentName, 
            e.HireDate,
           LEAD(e.HireDate) OVER (PARTITION BY e.DepartmentID ORDER BY e.HireDate) AS NextHireDate
    FROM Employees e
    JOIN Departments d 
            ON e.DepartmentID = d.DepartmentID
)
SELECT 
    EmployeeName, 
    DepartmentName, 
    HireDate, 
    NextHireDate,
    TIMESTAMPDIFF(MONTH, HireDate, NextHireDate) AS MonthsToNextHire
FROM HireDates
WHERE NextHireDate IS NOT NULL;
