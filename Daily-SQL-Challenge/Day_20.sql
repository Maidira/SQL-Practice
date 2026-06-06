-- Creating Products table
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Category VARCHAR(50),
    Price DECIMAL(6,2)
);

INSERT INTO Products VALUES
(1, 'Smartphone', 'Electronics', 799.99),
(2, 'Laptop', 'Electronics', 1200.50),
(3, 'Jeans', 'Clothing', 45.00),
(4, 'T-shirt', 'Clothing', 25.00);

-- Creating Customers table
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(100),
    City VARCHAR(50),
    Country VARCHAR(50)
);

INSERT INTO Customers VALUES
(101, 'Alice Smith', 'New York', 'USA'),
(102, 'Bob Johnson', 'San Francisco', 'USA'),
(103, 'Carlos Hernandez', 'Madrid', 'Spain'),
(104, 'Diana Chang', 'Tokyo', 'Japan');

-- Creating Sales table
CREATE TABLE Sales (
    SaleID INT PRIMARY KEY,
    CustomerID INT,
    ProductID INT,
    SaleDate DATE,
    Quantity INT,
    TotalAmount DECIMAL(8,2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

INSERT INTO Sales VALUES
(1001, 101, 1, '2024-10-15', 2, 1599.98),
(1002, 102, 2, '2024-10-16', 1, 1200.50),
(1003, 103, 3, '2024-10-17', 5, 225.00),
(1004, 104, 4, '2024-10-18', 3, 75.00);


-- Q1. Create a pivot table that shows the total sales amount for each product category by country.
SELECT 
    Category,
    SUM(CASE WHEN Country = 'USA' THEN TotalAmount ELSE 0 END) AS USA_Sales,
    SUM(CASE WHEN Country = 'Spain' THEN TotalAmount ELSE 0 END) AS Spain_Sales,
    SUM(CASE WHEN Country = 'Japan' THEN TotalAmount ELSE 0 END) AS Japan_Sales
FROM (
    SELECT
        p.Category, 
        c.Country, 
        s.TotalAmount
    FROM Sales s
    JOIN Products p 
        ON s.ProductID = p.ProductID
    JOIN Customers c
        ON s.CustomerID = c.CustomerID
) AS SourceTable
GROUP BY Category;


-- Q2. Transform the pivoted sales data back into a tabular format, showing country-wise sales for each category.
WITH cteSales AS (
    SELECT p.Category, 
           SUM(CASE WHEN c.Country = 'USA' THEN s.TotalAmount ELSE 0 END) AS USA_Sales,
           SUM(CASE WHEN c.Country = 'Spain' THEN s.TotalAmount ELSE 0 END) AS Spain_Sales,
           SUM(CASE WHEN c.Country = 'Japan' THEN s.TotalAmount ELSE 0 END) AS Japan_Sales
    FROM Sales s
    JOIN Products p 
        ON s.ProductID = p.ProductID
    JOIN Customers c 
        ON s.CustomerID = c.CustomerID
    GROUP BY p.Category
)
SELECT Category, 'USA' AS Country, USA_Sales AS Sales
FROM cteSales
UNION ALL
SELECT Category, 'Spain' AS Country, Spain_Sales AS Sales
FROM cteSales
UNION ALL
SELECT Category, 'Japan' AS Country, Japan_Sales AS Sales
FROM cteSales;
