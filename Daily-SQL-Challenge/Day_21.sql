CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    EmployeeName VARCHAR(100),
    ManagerID INT,
    DepartmentID INT,
    Salary DECIMAL(8,2),
    JoiningDate DATE
);

INSERT INTO Employees VALUES
(1, 'Alice', NULL, 101, 90000.00, '2018-05-01'),
(2, 'Bob', 1, 101, 80000.00, '2019-03-15'),
(3, 'Charlie', 1, 102, 75000.00, '2020-07-20'),
(4, 'David', 2, 103, 70000.00, '2021-10-11'),
(5, 'Eve', 3, 102, 65000.00, '2022-01-25');


CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(100),
    OrderDetails JSON,
    OrderDate DATE
);

INSERT INTO Orders VALUES
(1001, 'John Doe', '{"Product": "Laptop", "Quantity": 2, "Price": 1200}', '2023-09-01'),
(1002, 'Jane Smith', '{"Product": "Smartphone", "Quantity": 1, "Price": 800}', '2023-09-03'),
(1003, 'Alice Cooper', '{"Product": "Headphones", "Quantity": 5, "Price": 200}', '2023-09-05'),
(1004, 'Bob Marley', '{"Product": "Smartwatch", "Quantity": 3, "Price": 150}', '2023-09-07');


CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(100)
);

INSERT INTO Departments VALUES
(101, 'Engineering'),
(102, 'Marketing'),
(103, 'Sales');


-- Q1. Write a query to list all employees and their managers in a hierarchical structure.
WITH RECURSIVE EmployeeHierarchy AS (
    SELECT EmployeeID, EmployeeName, ManagerID, 1 AS Level
    FROM Employees
    WHERE ManagerID IS NULL

    UNION ALL

    SELECT e.EmployeeID, e.EmployeeName, e.ManagerID, eh.Level + 1
    FROM Employees e
    JOIN EmployeeHierarchy eh ON e.ManagerID = eh.EmployeeID
)
SELECT EmployeeID, EmployeeName, ManagerID, Level
FROM EmployeeHierarchy
ORDER BY Level, EmployeeID;


-- Q2. Extract the product name and quantity from the OrderDetails JSON column for all orders.
SELECT OrderID, CustomerName,
       JSON_UNQUOTE(JSON_EXTRACT(OrderDetails, '$.Product')) AS Product,
       JSON_EXTRACT(OrderDetails, '$.Quantity') AS Quantity
FROM Orders;


-- Q3. Rank employees by their salaries within each department. Include ties using the DENSE_RANK() function.
SELECT e.EmployeeID, e.EmployeeName, d.DepartmentName, e.Salary,
       DENSE_RANK() OVER (PARTITION BY e.DepartmentID ORDER BY e.Salary DESC) AS SalaryRank
FROM Employees e
JOIN Departments d ON e.DepartmentID = d.DepartmentID
ORDER BY d.DepartmentName, SalaryRank;


-- Q4. Find all employees whose names contain the letter 'a' as the third character. 
SELECT EmployeeName
FROM Employees
WHERE SUBSTR(EmployeeName, 3, 1) = 'a';


-- Q5. Pivot the sales data to show total revenue by each product in separate columns.
SELECT 
    SUM(CASE WHEN JSON_UNQUOTE(JSON_EXTRACT(OrderDetails, '$.Product')) = 'Laptop' THEN JSON_EXTRACT(OrderDetails, '$.Price') ELSE 0 END) AS LaptopSales,
    SUM(CASE WHEN JSON_UNQUOTE(JSON_EXTRACT(OrderDetails, '$.Product')) = 'Smartphone' THEN JSON_EXTRACT(OrderDetails, '$.Price') ELSE 0 END) AS SmartphoneSales,
    SUM(CASE WHEN JSON_UNQUOTE(JSON_EXTRACT(OrderDetails, '$.Product')) = 'Headphones' THEN JSON_EXTRACT(OrderDetails, '$.Price') ELSE 0 END) AS HeadphoneSales
FROM Orders;
