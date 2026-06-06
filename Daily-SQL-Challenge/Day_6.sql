CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    Name VARCHAR(100),
    Category VARCHAR(50),
    LaunchDate DATE,
    Price DECIMAL(10, 2)
);

INSERT INTO Products (ProductID, Name, Category, LaunchDate, Price) VALUES
(1, 'Smartphone A', 'Electronics', '2022-06-15', 699.99),
(2, 'Laptop B', 'Electronics', '2023-02-20', 999.99),
(3, 'Headphones C', 'Accessories', '2021-08-05', 199.99),
(4, 'Tablet D', 'Electronics', '2022-11-11', 499.99),
(5, 'Smartwatch E', 'Accessories', '2023-05-25', 299.99);


CREATE TABLE Sales (
    SaleID INT PRIMARY KEY,
    ProductID INT,
    SaleDate DATE,
    Quantity INT,
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

INSERT INTO Sales (SaleID, ProductID, SaleDate, Quantity) VALUES
(1, 1, '2023-01-10', 150),
(2, 2, '2023-02-14', 100),
(3, 3, '2023-03-18', 200),
(4, 4, '2023-04-22', 250),
(5, 5, '2023-05-30', 180),
(6, 1, '2023-06-15', 170),
(7, 2, '2023-07-20', 120),
(8, 3, '2023-08-12', 190),
(9, 4, '2023-09-25', 210),
(10, 5, '2023-10-30', 160);


-- Q1. Identify the top 2 best-selling products in each category for the year 2023 based on total quantity sold.
WITH cte AS (
    SELECT p.Name, 
          p.category, 
          SUM(s.Quantity) AS total_quantity,
          RANK() OVER(PARTITION BY p.category ORDER BY SUM(s.Quantity) DESC) AS rk
    FROM products p
    JOIN sales s 
    ON p.productid = s.productid
    WHERE YEAR(s.saledate) = 2023
    GROUP BY 
      p.Name, 
      p.category
)
SELECT * 
FROM cte
WHERE rk <= 2;


-- Q2. Calculate the cumulative quantity sold for each product in 2023, ordered by sale date.
WITH ProductSales2023 AS (
    SELECT s.ProductID, 
          p.Name, 
          s.SaleDate, 
          s.Quantity
    FROM Sales s
    JOIN Products p 
        ON s.ProductID = p.ProductID
    WHERE YEAR(s.SaleDate) = 2023
)
SELECT ProductID, 
        Name, 
        SaleDate, 
        Quantity,
        SUM(Quantity) OVER (PARTITION BY ProductID ORDER BY SaleDate) AS CumulativeQuantity
FROM ProductSales2023
ORDER BY 
    ProductID, 
    SaleDate;


-- Q3. Find the average monthly sales quantity per category for 2023 and compare each month's sales to this average. Display the month, category, quantity sold, and a column indicating whether the sales were "Above Average" or "Below Average."
WITH MonthlySales AS (
    SELECT p.Category,
          MONTH(s.SaleDate) AS SaleMonth, 
          SUM(s.Quantity) AS MonthlyQuantity
    FROM Sales s
    JOIN Products p 
        ON s.ProductID = p.ProductID
    WHERE YEAR(s.SaleDate) = 2023
    GROUP BY 
        p.Category, 
        MONTH(s.SaleDate)
),
AverageMonthlySales AS (
    SELECT Category, 
          AVG(MonthlyQuantity) AS AvgMonthlyQuantity
    FROM MonthlySales
    GROUP BY Category
)
SELECT ms.SaleMonth, 
      ms.Category, 
      ms.MonthlyQuantity,
       CASE
           WHEN ms.MonthlyQuantity > ams.AvgMonthlyQuantity THEN 'Above Average'
           ELSE 'Below Average'
       END AS SalesComparison
FROM MonthlySales ms
JOIN AverageMonthlySales ams 
    ON ms.Category = ams.Category
ORDER BY 
    ms.Category, 
    ms.SaleMonth;
