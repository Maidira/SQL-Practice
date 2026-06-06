CREATE TABLE MetricsTable (
    MetricID INT,
    Timestamp DATE,
    Value INT
);

INSERT INTO MetricsTable (MetricID, Timestamp, Value)
VALUES 
(1, '2024-11-16', 10),
(2, '2024-11-17', 20),
(3, '2024-11-18', 30),
(4, '2024-11-19', 40),
(5, '2024-11-20', 50),
(6, '2024-11-21', 60);


-- Q1. Write a uery to find moving average of last 5 values
SELECT
    MetricID,
    Timestamp,
    Value,
    AVG(Value) OVER (ORDER BY Timestamp ROWS BETWEEN 4 PRECEDING AND CURRENT ROW) AS MovingAverage
FROM MetricsTable;


-- Q2. Write a query to find 25 and 75 percentile
SELECT
    MAX(CASE WHEN percentile = 0.25 THEN Value END) AS Percentile25,
    MAX(CASE WHEN percentile = 0.75 THEN Value END) AS Percentile75
FROM (
    SELECT
        Value,
        NTILE(4) OVER (ORDER BY Value) / 4.0 AS percentile
    FROM MetricsTable
) AS DerivedTable
WHERE percentile IN (0.25, 0.75);


----------------------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE CumulativeTable (
    ID INT,
    Timestamp DATE,
    Value INT
);

INSERT INTO CumulativeTable (ID, Timestamp, Value)
VALUES 
(1, '2024-11-16', 10),
(2, '2024-11-17', 30),
(3, '2024-11-18', 60),
(4, '2024-11-19', 100),
(5, '2024-11-20', 150);


-- Q1. Given table with cummulative values, write a query to find incremental values.
SELECT 
    ID,
    Value AS CumulativeValue,
    Value - LAG(Value, 1, 0) OVER (ORDER BY Timestamp) AS IncrementalValue
FROM CumulativeTable;


-----------------------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE LanguageHistory (
    PersonID INT,
    Date DATE,
    Language VARCHAR(50)
);

INSERT INTO LanguageHistory (PersonID, Date, Language)
VALUES 
(1, '2024-11-16', 'SQL'),
(1, '2024-11-17', 'Python'),
(1, '2024-11-18', 'SQL'),
(2, '2024-11-16', 'Python'),
(2, '2024-11-17', 'SQL'),
(2, '2024-11-18', 'Python');


-- Q1. Write a query to find how many time a person switched from SQL to pythona and python to SQL
WITH Switches AS (
    SELECT 
        PersonID,
        Language,
        LEAD(Language) OVER (PARTITION BY PersonID ORDER BY Date) AS NextLanguage
    FROM LanguageHistory
)
SELECT 
    PersonID,
    COUNT(*) AS SQL_to_Python
FROM Switches
WHERE Language = 'SQL' AND NextLanguage = 'Python'
GROUP BY PersonID
UNION
SELECT 
    PersonID,
    COUNT(*) AS Python_to_SQL
FROM Switches
WHERE Language = 'Python' AND NextLanguage = 'SQL'
GROUP BY PersonID;
