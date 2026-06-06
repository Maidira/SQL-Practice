CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Category VARCHAR(50),
    Price DECIMAL(10, 2)
);

INSERT INTO Products (ProductID, ProductName, Category, Price) VALUES
(1, 'Laptop', 'Electronics', 1200.00),
(2, 'Smartphone', 'Electronics', 800.00),
(3, 'Desk Chair', 'Furniture', 150.00),
(4, 'Table Lamp', 'Home Decor', 50.00),
(5, 'Coffee Maker', 'Kitchen Appliances', 100.00),
(6, 'Headphones', 'Electronics', 200.00),
(7, 'Office Desk', 'Furniture', 400.00);

CREATE TABLE Sales (
    SaleID INT PRIMARY KEY,
    ProductID INT,
    SaleDate DATE,
    Quantity INT,
    TotalRevenue DECIMAL(10, 2),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

INSERT INTO Sales (SaleID, ProductID, SaleDate, Quantity, TotalRevenue) VALUES
(1, 1, '2023-01-10', 2, 2400.00),
(2, 2, '2023-01-15', 5, 4000.00),
(3, 3, '2023-02-01', 1, 150.00),
(4, 4, '2023-02-20', 3, 150.00),
(5, 5, '2023-03-10', 2, 200.00),
(6, 6, '2023-03-15', 4, 800.00),
(7, 7, '2023-04-05', 1, 400.00),
(8, 1, '2023-04-20', 1, 1200.00),
(9, 3, '2023-05-10', 2, 300.00);


-- Q1. Identify the top 2 best-selling products in each category based on total revenue. Display the product name, category, and total revenue using RANK() window function.
SELECT ProductName, 
      Category, 
      TotalRevenue, 
      RevenueRank
FROM (
    SELECT ProductName, Category, 
           SUM(TotalRevenue) AS TotalRevenue,
           RANK() OVER (PARTITION BY Category ORDER BY SUM(TotalRevenue) DESC) AS RevenueRank
    FROM Products p
    JOIN Sales s 
        ON p.ProductID = s.ProductID
    GROUP BY 
        ProductName, Category
) Ranked
WHERE RevenueRank <= 2
ORDER BY 
      Category, 
      RevenueRank;


-- Q2. Calculate the month-over-month sales growth for each product using the LAG() function. Display the product name, sale date, current month revenue, previous month revenue, and growth percentage.
WITH MonthlySales AS (
    SELECT p.ProductName, 
           DATE_FORMAT(s.SaleDate, '%Y-%m') AS SaleMonth,
           SUM(s.TotalRevenue) AS MonthlyRevenue
    FROM Products p
    JOIN Sales s 
        ON p.ProductID = s.ProductID
    GROUP BY 
        p.ProductName, 
        SaleMonth
),
SalesGrowth AS (
    SELECT 
        ProductName, 
        SaleMonth, 
        MonthlyRevenue,
        LAG(MonthlyRevenue) OVER (PARTITION BY ProductName ORDER BY SaleMonth) AS PreviousMonthRevenue
    FROM MonthlySales
)
SELECT 
    ProductName, 
    SaleMonth, 
    MonthlyRevenue, 
    PreviousMonthRevenue,
    ROUND(((MonthlyRevenue - PreviousMonthRevenue) / PreviousMonthRevenue) * 100, 2) AS GrowthPercentage
FROM SalesGrowth
WHERE PreviousMonthRevenue IS NOT NULL;


-- Q3. Find the cumulative sales quantity for each product category using a CROSS APPLY join. Display the category, product name, sale date, quantity, and cumulative quantity using SUM() as a window function.
SELECT 
    p.Category, 
    p.ProductName,
    s.SaleDate, 
    s.Quantity,
    SUM(s.Quantity) OVER (PARTITION BY p.Category ORDER BY s.SaleDate) AS CumulativeQuantity
FROM Products p
JOIN Sales s 
    ON p.ProductID = s.ProductID
ORDER BY 
    p.Category, 
    s.SaleDate;



