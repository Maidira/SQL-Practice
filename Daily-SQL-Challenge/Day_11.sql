CREATE TABLE Suppliers (
    SupplierID INT PRIMARY KEY,
    SupplierName VARCHAR(100),
    City VARCHAR(50),
    Rating INT
);

INSERT INTO Suppliers (SupplierID, SupplierName, City, Rating) VALUES
(1, 'Global Supplies', 'New York', 5),
(2, 'Tech Distributors', 'Los Angeles', 4),
(3, 'Office Essentials', 'Chicago', 3),
(4, 'Furniture World', 'Houston', 5),
(5, 'Gadgets & More', 'Phoenix', 2);


CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Category VARCHAR(50),
    Price DECIMAL(10, 2),
    SupplierID INT,
    FOREIGN KEY (SupplierID) REFERENCES Suppliers(SupplierID)
);

INSERT INTO Products (ProductID, ProductName, Category, Price, SupplierID) VALUES
(1, 'Laptop', 'Electronics', 950.00, 1),
(2, 'Smartphone', 'Electronics', 550.00, 2),
(3, 'Office Chair', 'Furniture', 150.00, 3),
(4, 'Desk', 'Furniture', 250.00, 4),
(5, 'Tablet', 'Electronics', 300.00, 5),
(6, 'Printer', 'Electronics', 120.00, 2),
(7, 'Monitor', 'Electronics', 220.00, 1);


CREATE TABLE Sales (
    SaleID INT PRIMARY KEY,
    ProductID INT,
    SaleDate DATE,
    Quantity INT,
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

INSERT INTO Sales (SaleID, ProductID, SaleDate, Quantity) VALUES
(1, 1, '2023-01-10', 5),
(2, 2, '2023-02-14', 10),
(3, 3, '2023-03-01', 3),
(4, 4, '2023-04-05', 4),
(5, 5, '2023-04-22', 7),
(6, 6, '2023-05-30', 2),
(7, 7, '2023-06-15', 8),
(8, 1, '2023-07-20', 6),
(9, 2, '2023-08-12', 3),
(10, 3, '2023-09-15', 9);


-- Q1. Find the top 3 suppliers based on the total revenue generated from their products. Display the supplier name, total revenue, and their rank.
WITH cte AS(
SELECT s.supplierid, s.suppliername, SUM(p.price * sa.quantity) AS totalRevenue,
	RANK() OVER(ORDER BY SUM(p.price * sa.quantity) DESC) as rk
FROM suppliers s
JOIN products p
ON s.supplierid = p.supplierid
JOIN sales sa
ON p.productid = sa.productid
GROUP BY s.supplierid, s.suppliername
)

SELECT suppliername, totalrevenue, rk
FROM cte
WHERE rk <= 3;


-- Q2. For each product category, find the monthly sales trend by showing the month, category, total quantity sold, and the difference in sales quantity compared to the previous month.
WITH MonthlySales AS (
    SELECT p.Category,
           DATE_FORMAT(sa.SaleDate, '%Y-%m') AS SaleMonth,
           SUM(sa.Quantity) AS TotalQuantity
    FROM Sales sa
    JOIN Products p ON sa.ProductID = p.ProductID
    GROUP BY p.Category, SaleMonth
),
MonthlyTrend AS (
    SELECT Category, SaleMonth, TotalQuantity,
           LAG(TotalQuantity) OVER (PARTITION BY Category ORDER BY SaleMonth) AS PreviousMonthQuantity
    FROM MonthlySales
)
SELECT Category, SaleMonth, TotalQuantity,
       (TotalQuantity - COALESCE(PreviousMonthQuantity, 0)) AS QuantityChange
FROM MonthlyTrend;
