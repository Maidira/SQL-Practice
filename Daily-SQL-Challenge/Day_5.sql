CREATE TABLE Books (
    BookID INT PRIMARY KEY,
    Title VARCHAR(100),
    Genre VARCHAR(50),
    PublicationDate DATE,
    Price DECIMAL(10, 2)
);

INSERT INTO Books (BookID, Title, Genre, PublicationDate, Price) VALUES
(1, 'The Silent Patient', 'Thriller', '2019-02-05', 20.00),
(2, 'Where the Crawdads Sing', 'Fiction', '2018-08-14', 25.00),
(3, 'Educated', 'Memoir', '2018-02-18', 30.00),
(4, 'Becoming', 'Memoir', '2018-11-13', 28.00),
(5, 'Atomic Habits', 'Self-Help', '2018-10-16', 24.00);


CREATE TABLE Authors (
    AuthorID INT PRIMARY KEY,
    Name VARCHAR(100),
    Country VARCHAR(50),
    BirthDate DATE
);

INSERT INTO Authors (AuthorID, Name, Country, BirthDate) VALUES
(1, 'Alex Michaelides', 'Cyprus', '1977-09-30'),
(2, 'Delia Owens', 'USA', '1949-04-04'),
(3, 'Tara Westover', 'USA', '1986-09-27'),
(4, 'Michelle Obama', 'USA', '1964-01-17'),
(5, 'James Clear', 'USA', '1986-01-22');


CREATE TABLE BookAuthors (
    BookID INT,
    AuthorID INT,
    PRIMARY KEY (BookID, AuthorID),
    FOREIGN KEY (BookID) REFERENCES Books(BookID),
    FOREIGN KEY (AuthorID) REFERENCES Authors(AuthorID)
);

INSERT INTO BookAuthors (BookID, AuthorID) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);


CREATE TABLE Sales (
    SaleID INT PRIMARY KEY,
    BookID INT,
    SaleDate DATE,
    Quantity INT,
    FOREIGN KEY (BookID) REFERENCES Books(BookID)
);

INSERT INTO Sales (SaleID, BookID, SaleDate, Quantity) VALUES
(1, 1, '2023-01-15', 100),
(2, 2, '2023-02-10', 200),
(3, 3, '2023-03-05', 150),
(4, 4, '2023-04-12', 180),
(5, 5, '2023-05-20', 220);


-- Q1. Find the authors who have books published before 2019 with average sales quantity greater than the average sales quantity of all books published after 2019.
SELECT a.Name
FROM Authors a
JOIN BookAuthors ba 
ON a.AuthorID = ba.AuthorID
JOIN Books b 
ON ba.BookID = b.BookID
JOIN Sales s 
ON b.BookID = s.BookID
WHERE b.PublicationDate < '2019-01-01'
GROUP BY 
  a.AuthorID, 
  a.Name
HAVING AVG(s.Quantity) > (
    SELECT AVG(s2.Quantity)
    FROM Books b2
    JOIN Sales s2 
    ON b2.BookID = s2.BookID
    WHERE b2.PublicationDate >= '2019-01-01'
);


-- Q2. List the genres with a total revenue (price * quantity) in 2023 that is higher than the overall average revenue across all genres in 2023.
SELECT b.Genre
FROM Books b
JOIN Sales s 
  ON b.BookID = s.BookID
WHERE YEAR(s.SaleDate) = 2023
GROUP BY b.Genre
HAVING SUM(b.Price * s.Quantity) > (
    SELECT AVG(totalRevenue)
    FROM (
        SELECT SUM(b2.Price * s2.Quantity) AS totalRevenue
        FROM Books b2
        JOIN Sales s2 
        ON b2.BookID = s2.BookID
        WHERE YEAR(s2.SaleDate) = 2023
        GROUP BY b2.Genre
    ) AS GenreRevenue
);
