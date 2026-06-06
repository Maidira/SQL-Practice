CREATE TABLE Customers (
    CustomerID INT,
    CustomerName VARCHAR(100),
    Email VARCHAR(100),
    SignupDate DATE,
    City VARCHAR(50)
);

INSERT INTO Customers (CustomerID, CustomerName, Email, SignupDate, City) VALUES
(1, 'John Doe', 'johndoe@example.com', '2022-01-15', 'New York'),
(2, 'Jane Smith', 'janesmith@example.com', '2022-02-20', 'Los Angeles'),
(3, 'John Doe', 'johndoe@example.com', '2022-01-15', 'New York'),
(4, 'Mike Johnson', 'mikej@example.com', '2022-03-10', 'Chicago'),
(5, 'Jane Smith', 'janesmith@example.com', '2022-02-20', 'Los Angeles'),
(6, 'Alice Brown', 'aliceb@example.com', '2022-04-05', 'Houston');


-- Q1. Write a query to delete exact duplicate rows from the Customers table, keeping only one instance of each duplicate.
WITH RankedCustomers AS (
    SELECT *,
           ROW_NUMBER() OVER (PARTITION BY CustomerName, Email, SignupDate, City ORDER BY CustomerID) AS RowNum
    FROM Customers
)
DELETE FROM Customers
WHERE CustomerID IN (
    SELECT CustomerID
    FROM RankedCustomers
    WHERE RowNum > 1
);


-- Q2. Write a query to remove duplicate entries based on the Email column, keeping only the earliest signup date for each customer.
WITH DistinctEmails AS (
    SELECT Email, MIN(SignupDate) AS EarliestSignup
    FROM Customers
    GROUP BY Email
)
DELETE FROM Customers
WHERE (Email, SignupDate) NOT IN (
    SELECT Email, EarliestSignup
    FROM DistinctEmails
);


-- Q3. Find duplicate customers by name who signed up in the same city, and delete duplicates keeping only one entry per city.
DELETE c1
FROM Customers c1
JOIN Customers c2 
  ON c1.CustomerName = c2.CustomerName
 AND c1.City = c2.City
 AND c1.CustomerID > c2.CustomerID;
