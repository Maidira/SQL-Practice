CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(50),
    City VARCHAR(50),
    MembershipStart DATE
);

INSERT INTO Customers (CustomerID, CustomerName, City, MembershipStart) VALUES
(1, 'John Doe', 'New York', '2021-05-15'),
(2, 'Jane Smith', 'Chicago', '2023-01-10'),
(3, 'Sam Brown', 'San Francisco', '2022-08-01'),
(4, 'Emily Davis', 'Los Angeles', '2023-03-20'),
(5, 'Michael Johnson', 'New York', '2023-06-01');

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(50),
    Category VARCHAR(50),
    Price DECIMAL(10, 2)
);

INSERT INTO Products (ProductID, ProductName, Category, Price) VALUES
(1, 'Laptop', 'Electronics', 1200.00),
(2, 'Smartphone', 'Electronics', 800.00),
(3, 'Table', 'Furniture', 150.00),
(4, 'Chair', 'Furniture', 85.00),
(5, 'Refrigerator', 'Appliances', 1000.00);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    TotalAmount DECIMAL(10, 2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

INSERT INTO Orders (OrderID, CustomerID, OrderDate, TotalAmount) VALUES
(1, 1, '2023-01-15', 1350.00),
(2, 2, '2023-02-18', 900.00),
(3, 3, '2023-03-25', 235.00),
(4, 4, '2023-04-10', 85.00),
(5, 5, '2023-05-20', 2200.00);

CREATE TABLE OrderDetails (
    OrderID INT,
    ProductID INT,
    Quantity INT,
    PRIMARY KEY (OrderID, ProductID),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

INSERT INTO OrderDetails (OrderID, ProductID, Quantity) VALUES
(1, 1, 1),
(1, 3, 1),
(2, 2, 1),
(3, 4, 2),
(4, 4, 1),
(5, 1, 2),
(5, 5, 1);


-- Q1. Find the names of customers who placed an order with a total amount exceeding $1,000 in 2023 and who have been members since before 2023.
SELECT c.CustomerName
FROM Customers c
JOIN Orders o 
ON c.CustomerID = o.CustomerID
WHERE 
  o.TotalAmount > 1000
  AND 
  o.OrderDate 
  BETWEEN 
  '2023-01-01' 
  AND 
  '2023-12-31'
  AND 
  c.MembershipStart < '2023-01-01';


-- Q2. List the product categories for which the average price of purchased products in 2023 exceeds $500.
SELECT p.category
FROM products p 
JOIN orderdetails od
ON p.productid = od.productid
JOIN orders o
ON od.orderid = o.orderid
WHERE 
  o.orderdate 
  BETWEEN 
  '2023-01-01' 
  AND 
  '2023-12-31'
GROUP BY p.category
HAVING AVG(p.price) > 500;


-- Q3. Retrieve the names of customers who ordered products from more than one category in a single order in 2023.
SELECT c.CustomerName
FROM Customers c
JOIN Orders o 
  ON c.CustomerID = o.CustomerID
JOIN OrderDetails od 
  ON o.OrderID = od.OrderID
JOIN Products p 
  ON od.ProductID = p.ProductID
WHERE o.OrderDate 
  BETWEEN 
  '2023-01-01' 
  AND 
  '2023-12-31'
GROUP BY 
  c.CustomerID, 
  c.CustomerName, 
  o.OrderID
HAVING COUNT(DISTINCT p.Category) > 1;
