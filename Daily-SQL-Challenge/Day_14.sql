CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    TotalAmount DECIMAL(10, 2)
);

INSERT INTO Orders (OrderID, CustomerID, OrderDate, TotalAmount) VALUES
(1, 101, '2023-01-10', 250.00),
(2, 102, '2023-01-15', 450.00),
(3, 101, '2023-02-10', 300.00),
(4, 103, '2023-02-15', 500.00),
(5, 104, '2023-03-05', 600.00),
(6, 101, '2023-03-20', 700.00),
(7, 102, '2023-04-10', 400.00),
(8, 104, '2023-04-15', 800.00),
(9, 103, '2023-05-10', 900.00),
(10, 101, '2023-05-20', 750.00);


CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(100),
    JoinDate DATE,
    Region VARCHAR(50)
);

INSERT INTO Customers (CustomerID, CustomerName, JoinDate, Region) VALUES
(101, 'John Doe', '2022-12-01', 'North'),
(102, 'Jane Smith', '2022-12-15', 'South'),
(103, 'Emma Brown', '2023-01-20', 'East'),
(104, 'Michael Green', '2023-02-10', 'West');


-- Q1.
SELECT c.CustomerName, 
        o.OrderDate, 
        o.TotalAmount,
       SUM(o.TotalAmount) OVER (PARTITION BY o.CustomerID ORDER BY o.OrderDate) AS CumulativeTotal
FROM Orders o
JOIN Customers c 
    ON o.CustomerID = c.CustomerID
ORDER BY 
    o.CustomerID, 
    o.OrderDate;


-- Q2. 
WITH MonthlySpending AS (
    SELECT o.CustomerID, 
          c.CustomerName, 
          o.OrderDate, 
          o.TotalAmount,
           LAG(o.TotalAmount) OVER (PARTITION BY o.CustomerID ORDER BY o.OrderDate) AS PreviousMonthAmount
    FROM Orders o
    JOIN Customers c 
          ON o.CustomerID = c.CustomerID
)
SELECT 
    CustomerName, 
    OrderDate, 
    TotalAmount,
    TotalAmount - PreviousMonthAmount AS MonthlyChange
FROM MonthlySpending
WHERE PreviousMonthAmount IS NOT NULL;


-- Q3.
WITH CumulativeOrders AS (
    SELECT c.CustomerName, 
           o.OrderDate, 
           o.TotalAmount,
           SUM(o.TotalAmount) OVER (PARTITION BY o.CustomerID ORDER BY o.OrderDate) AS CumulativeTotal
    FROM Orders o
    JOIN Customers c 
          ON o.CustomerID = c.CustomerID
)
SELECT 
    CustomerName, 
    OrderDate, 
    CumulativeTotal
FROM CumulativeOrders
WHERE 
    CumulativeTotal >= 1000
    AND 
    CumulativeTotal - TotalAmount < 1000
ORDER BY 
  CustomerName, 
  OrderDate;




