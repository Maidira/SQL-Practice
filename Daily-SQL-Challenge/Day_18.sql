CREATE TABLE Accounts (
    AccountID INT PRIMARY KEY,
    AccountHolder VARCHAR(50),
    Email VARCHAR(100),
    AccountType VARCHAR(20),
    CreatedDate DATE
);

INSERT INTO Accounts VALUES
(1, 'John Doe', 'john.doe@example.com', 'Savings', '2022-01-15'),
(2, 'Jane Smith', 'jane.smith@bank.com', 'Current', '2021-03-10'),
(3, 'Mike Brown', 'mike.brown@finance.net', 'Savings', '2022-05-20'),
(4, 'Emily Davis', 'emily.davis@wealth.org', 'Current', '2023-02-14');

CREATE TABLE Transactions (
    TransactionID INT PRIMARY KEY,
    AccountID INT,
    TransactionDate DATE,
    Amount DECIMAL(10,2),
    TransactionType VARCHAR(10),
    FOREIGN KEY (AccountID) REFERENCES Accounts(AccountID)
);

INSERT INTO Transactions VALUES
(101, 1, '2023-09-15', 500.00, 'Deposit'),
(102, 2, '2023-09-16', 1000.00, 'Withdraw'),
(103, 3, '2023-09-18', 2000.00, 'Deposit'),
(104, 4, '2023-09-19', 1500.00, 'Withdraw'),
(105, 1, '2023-10-10', 300.00, 'Withdraw'),
(106, 2, '2023-10-12', 700.00, 'Deposit'),
(107, 3, '2023-10-15', 900.00, 'Withdraw'),
(108, 4, '2023-10-18', 1200.00, 'Deposit');


-- Q1. Calculate the cumulative balance over time, but only include deposits. If the balance reaches or exceeds $2000, stop including further transactions for that account.
WITH CumulativeDeposits AS (
    SELECT 
        t.AccountID,
        a.AccountHolder,
        t.TransactionDate,
        t.Amount,
        SUM(CASE WHEN t.TransactionType = 'Deposit' THEN t.Amount ELSE 0 END) 
            OVER (PARTITION BY t.AccountID ORDER BY t.TransactionDate) AS CumulativeBalance
    FROM Transactions t
    JOIN Accounts a 
        ON t.AccountID = a.AccountID
)
SELECT 
    AccountID, 
    AccountHolder, 
    TransactionDate, 
    CumulativeBalance
FROM CumulativeDeposits
WHERE CumulativeBalance < 2000
ORDER BY
    AccountID, 
    TransactionDate;


-- Q2. Extract the domain of each account holder's email, but only show results where the email domain ends with .com or .net. Sort the result by domain and account holder name.
SELECT 
    AccountHolder,
    Email,
    SUBSTR(Email, INSTR(Email, '@') + 1) AS Domain
FROM Accounts
WHERE Email REGEXP '\\.(com|net)$'
ORDER BY Domain, AccountHolder;


-- Q3. Find accounts with no transactions in the last 60 days. Return their details and mark them as "Inactive".
SELECT 
    a.AccountID,
    a.AccountHolder,
    a.AccountType,
    CASE 
        WHEN MAX(t.TransactionDate) < CURDATE() - INTERVAL 60 DAY 
             OR MAX(t.TransactionDate) IS NULL 
        THEN 'Inactive'
        ELSE 'Active'
    END AS Status
FROM Accounts a
LEFT JOIN Transactions t 
    ON a.AccountID = t.AccountID
GROUP BY 
    a.AccountID, 
    a.AccountHolder, 
    a.AccountType
HAVING Status = 'Inactive';




