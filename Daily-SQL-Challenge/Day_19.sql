CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(50),
    Email VARCHAR(100),
    PhoneNumber VARCHAR(15),
    City VARCHAR(30)
);


INSERT INTO Customers VALUES
(1, 'Alice Johnson', 'alice.j@example.com', '555-1234', 'New York'),
(2, 'Bob Smith', 'bob.smith@domain.com', '555-5678', 'Los Angeles'),
(3, 'Carol White', 'carol.white@xyz.com', '555-8765', 'Chicago'),
(4, 'David Brown', 'david.b@abc.net', '555-4321', 'San Francisco');

-- Creating Products table
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(50),
    Category VARCHAR(30),
    Price DECIMAL(8,2)
);


INSERT INTO Products VALUES
(101, 'Laptop', 'Electronics', 1500.00),
(102, 'Smartphone', 'Electronics', 800.00),
(103, 'Tablet', 'Electronics', 600.00),
(104, 'Headphones', 'Accessories', 150.00);


CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    TotalAmount DECIMAL(10,2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);


INSERT INTO Orders VALUES
(201, 1, '2024-10-01', 2000.00),
(202, 2, '2024-10-05', 1200.00),
(203, 3, '2024-10-07', 1500.00),
(204, 4, '2024-10-09', 900.00);


CREATE TABLE OrderDetails (
    OrderDetailID INT PRIMARY KEY,
    OrderID INT,
    ProductID INT,
    Quantity INT,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);


INSERT INTO OrderDetails VALUES
(301, 201, 101, 1),
(302, 201, 104, 3),
(303, 202, 102, 1),
(304, 203, 103, 2),
(305, 204, 104, 2);


-- Q1. For each city, find the top customer based on total spending. Use window functions to rank customers and return only the top-ranked customer from each city.
WITH CustomerSpending AS (
    SELECT 
        c.CustomerID,
        c.CustomerName,
        c.City,
        SUM(o.TotalAmount) AS TotalSpending,
        RANK() OVER (PARTITION BY c.City ORDER BY SUM(o.TotalAmount) DESC) AS SpendingRank
    FROM Customers c
    JOIN Orders o 
        ON c.CustomerID = o.CustomerID
    GROUP BY 
        c.CustomerID, 
        c.CustomerName, 
        c.City
)
SELECT CustomerName, City, TotalSpending
FROM CustomerSpending
WHERE SpendingRank = 1;


-- Q2. Identify the trend in sales for each product by calculating the difference in quantity sold from one order to the next for that product. If a product's sales quantity has increased in consecutive orders, mark it as 'Rising'; otherwise, mark it as 'Falling'.
WITH SalesTrend AS (
    SELECT 
        p.ProductName,
        o.OrderDate,
        od.Quantity,
        LAG(od.Quantity, 1, 0) OVER (PARTITION BY p.ProductID ORDER BY o.OrderDate) AS PrevQuantity,
        (od.Quantity - LAG(od.Quantity, 1, 0) OVER (PARTITION BY p.ProductID ORDER BY o.OrderDate)) AS QuantityChange
    FROM OrderDetails od
    JOIN Orders o 
        ON od.OrderID = o.OrderID
    JOIN Products p 
        ON od.ProductID = p.ProductID
)
SELECT 
    ProductName, 
    OrderDate, 
    Quantity, 
    QuantityChange,
    CASE 
        WHEN QuantityChange > 0 THEN 'Rising'
        ELSE 'Falling'
    END AS Trend
FROM SalesTrend
ORDER BY 
    ProductName, 
    OrderDate;

