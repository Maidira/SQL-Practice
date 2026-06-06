CREATE TABLE Invoices (
    InvoiceID INT,
    CustomerID INT,
    InvoiceDate DATE,
    TotalAmount DECIMAL(10, 2),
    PaidStatus BOOLEAN,
    PaymentMethod VARCHAR(50)
);

CREATE TABLE Payments (
    PaymentID INT,
    InvoiceID INT,
    PaymentDate DATE,
    PaymentAmount DECIMAL(10, 2),
    PaymentDetails JSON
);

INSERT INTO Invoices (InvoiceID, CustomerID, InvoiceDate, TotalAmount, PaidStatus, PaymentMethod) VALUES
(1, 101, '2023-01-01', 500.00, FALSE, NULL),
(2, 102, '2023-02-10', 700.00, TRUE, 'Credit Card'),
(3, 103, '2023-03-15', 250.00, FALSE, NULL),
(4, 104, '2023-04-20', 900.00, TRUE, 'Bank Transfer'),
(5, 105, '2023-05-25', 1200.00, FALSE, NULL);

INSERT INTO Payments (PaymentID, InvoiceID, PaymentDate, PaymentAmount, PaymentDetails) VALUES
(1, 2, '2023-02-12', 700.00, '{"transactionID": "TXN123", "bank": "Chase"}'),
(2, 4, '2023-04-22', 900.00, '{"transactionID": "TXN124", "bank": "Wells Fargo"}'),
(3, 5, '2023-06-01', 600.00, '{"transactionID": "TXN125", "bank": "Bank of America"}'),
(4, 5, '2023-06-15', 600.00, '{"transactionID": "TXN126", "bank": "CitiBank"}');


-- Q1. Retrieve the bank field from the PaymentDetails JSON for all payments where the total payment amount equals the invoice amount.
SELECT p.PaymentID, 
       i.InvoiceID, 
       JSON_EXTRACT(p.PaymentDetails, '$.bank') AS BankName
FROM Payments p
JOIN Invoices i ON p.InvoiceID = i.InvoiceID
GROUP BY p.PaymentID, i.InvoiceID, i.TotalAmount
HAVING SUM(p.PaymentAmount) = MAX(i.TotalAmount);


-- Q2. Create a recursive query to calculate outstanding amounts for invoices paid in installments.
WITH RECURSIVE OutstandingAmount AS (
    SELECT i.InvoiceID, i.TotalAmount - COALESCE(SUM(p.PaymentAmount), 0) AS RemainingAmount, 1 AS PaymentCount
    FROM Invoices i
    LEFT JOIN Payments p ON i.InvoiceID = p.InvoiceID
    WHERE i.PaidStatus = FALSE
    GROUP BY i.InvoiceID
    
    UNION ALL
    
    SELECT o.InvoiceID, o.RemainingAmount - p.PaymentAmount, o.PaymentCount + 1
    FROM OutstandingAmount o
    JOIN Payments p ON o.InvoiceID = p.InvoiceID
    WHERE o.RemainingAmount > 0
)
SELECT InvoiceID, MAX(RemainingAmount) AS OutstandingBalance, MAX(PaymentCount) AS Installments
FROM OutstandingAmount
GROUP BY InvoiceID;


-- Q3. Pivot the payments to show total payment amounts by month for each invoice.
SELECT InvoiceID,
       SUM(CASE WHEN MONTH(PaymentDate) = 1 THEN PaymentAmount ELSE 0 END) AS January,
       SUM(CASE WHEN MONTH(PaymentDate) = 2 THEN PaymentAmount ELSE 0 END) AS February,
       SUM(CASE WHEN MONTH(PaymentDate) = 3 THEN PaymentAmount ELSE 0 END) AS March,
       SUM(CASE WHEN MONTH(PaymentDate) = 4 THEN PaymentAmount ELSE 0 END) AS April,
       SUM(CASE WHEN MONTH(PaymentDate) = 5 THEN PaymentAmount ELSE 0 END) AS May,
       SUM(CASE WHEN MONTH(PaymentDate) = 6 THEN PaymentAmount ELSE 0 END) AS June
FROM Payments
GROUP BY InvoiceID;
