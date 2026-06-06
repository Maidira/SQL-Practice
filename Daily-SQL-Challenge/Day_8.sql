CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Category VARCHAR(50),
    Price DECIMAL(10, 2),
    Stock INT
);

INSERT INTO Products (ProductID, ProductName, Category, Price, Stock) VALUES
(1, 'Smartphone', 'Electronics', 299.99, 120),
(2, 'Laptop', 'Electronics', 799.99, 80),
(3, 'Headphones', 'Electronics', 149.99, 200),
(4, 'Sofa', 'Furniture', 499.99, 45),
(5, 'Dining Table', 'Furniture', 799.99, 30),
(6, 'Jacket', 'Clothing', 129.99, 100),
(7, 'T-Shirt', 'Clothing', 19.99, 500),
(8, 'Jeans', 'Clothing', 59.99, 150),
(9, 'Blender', 'Appliances', 89.99, 75),
(10, 'Microwave', 'Appliances', 119.99, 60);

CREATE TABLE Sales (
    SaleID INT PRIMARY KEY,
    ProductID INT,
    SaleDate DATE,
    Quantity INT,
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

INSERT INTO Sales (SaleID, ProductID, SaleDate, Quantity) VALUES
(1, 1, '2023-01-05', 20),
(2, 2, '2023-01-15', 10),
(3, 3, '2023-02-20', 50),
(4, 4, '2023-03-10', 15),
(5, 5, '2023-03-25', 5),
(6, 6, '2023-04-12', 25),
(7, 7, '2023-05-05', 100),
(8, 8, '2023-06-14', 60),
(9, 9, '2023-07-08', 30),
(10, 10, '2023-08-18', 20);


-- Q1. Find the top-selling product in each category based on total sales quantity in 2023. Display the category, product name, and total sales quantity.
WITH ProductSales AS (
    SELECT p.Category, p.ProductName, SUM(s.Quantity) AS TotalSales
    FROM Products p
    JOIN Sales s ON p.ProductID = s.ProductID
    WHERE YEAR(s.SaleDate) = 2023
    GROUP BY p.Category, p.ProductName
),
RankedSales AS (
    SELECT Category, ProductName, TotalSales,
           RANK() OVER (PARTITION BY Category ORDER BY TotalSales DESC) AS SalesRank
    FROM ProductSales
)
SELECT Category, ProductName, TotalSales
FROM RankedSales
WHERE SalesRank = 1;


-- Q2. Calculate the cumulative sales quantity of each product over time in 2023, and display the product name, sale date, quantity sold, and cumulative quantity.
SELECT p.ProductName, s.SaleDate, s.Quantity,
       SUM(s.Quantity) OVER (PARTITION BY p.ProductID ORDER BY s.SaleDate) AS CumulativeQuantity
FROM Sales s
JOIN Products p ON s.ProductID = p.ProductID
WHERE YEAR(s.SaleDate) = 2023
ORDER BY p.ProductName, s.SaleDate;


-- Q3. Identify products with sales that are at least 10% of the total stock in 2023. Display the product name, category, total sales, stock, and percentage of stock sold.
WITH TotalSales AS (
    SELECT p.ProductID, p.ProductName, p.Category, p.Stock, SUM(s.Quantity) AS TotalSales
    FROM Products p
    LEFT JOIN Sales s ON p.ProductID = s.ProductID AND YEAR(s.SaleDate) = 2023
    GROUP BY p.ProductID, p.ProductName, p.Category, p.Stock
)
SELECT ProductName, Category, TotalSales, Stock,
       ROUND((TotalSales / Stock) * 100, 2) AS StockSoldPercentage
FROM TotalSales
WHERE (TotalSales / Stock) >= 0.10;
