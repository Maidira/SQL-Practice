CREATE TABLE Authors (
    AuthorID INT PRIMARY KEY,
    AuthorName VARCHAR(100),
    Country VARCHAR(50),
    BirthYear INT
);

INSERT INTO Authors (AuthorID, AuthorName, Country, BirthYear) VALUES
(1, 'Alice Munro', 'Canada', 1931),
(2, 'Haruki Murakami', 'Japan', 1949),
(3, 'Chinua Achebe', 'Nigeria', 1930),
(4, 'Gabriel Garcia Marquez', 'Colombia', 1927),
(5, 'Toni Morrison', 'USA', 1931);


CREATE TABLE Books (
    BookID INT PRIMARY KEY,
    Title VARCHAR(100),
    AuthorID INT,
    Genre VARCHAR(50),
    PublishedYear INT,
    FOREIGN KEY (AuthorID) REFERENCES Authors(AuthorID)
);

INSERT INTO Books (BookID, Title, AuthorID, Genre, PublishedYear) VALUES
(1, 'Dance of the Happy Shades', 1, 'Short Stories', 1968),
(2, 'Norwegian Wood', 2, 'Fiction', 1987),
(3, 'Things Fall Apart', 3, 'Historical Fiction', 1958),
(4, 'One Hundred Years of Solitude', 4, 'Magic Realism', 1967),
(5, 'Beloved', 5, 'Historical Fiction', 1987),
(6, 'Blind Willow, Sleeping Woman', 2, 'Short Stories', 2006),
(7, 'Love in the Time of Cholera', 4, 'Romance', 1985);


CREATE TABLE Reviews (
    ReviewID INT PRIMARY KEY,
    BookID INT,
    Rating INT CHECK (Rating BETWEEN 1 AND 5),
    ReviewDate DATE,
    FOREIGN KEY (BookID) REFERENCES Books(BookID)
);

INSERT INTO Reviews (ReviewID, BookID, Rating, ReviewDate) VALUES
(1, 1, 4, '2023-01-15'),
(2, 2, 5, '2023-02-12'),
(3, 3, 3, '2023-03-10'),
(4, 4, 5, '2023-04-01'),
(5, 5, 4, '2023-05-20'),
(6, 6, 2, '2023-06-18'),
(7, 7, 4, '2023-07-25'),
(8, 1, 5, '2023-08-15'),
(9, 2, 4, '2023-09-01');


-- Q1. Find all authors who have published books in the genre of ‘Historical Fiction’ and received an average rating of 4 or higher. Display the author's name, book title, and average rating.
WITH cte AS(
	SELECT 
		a.authorid,
        a.authorname,
        b.title,
        AVG(r.rating) AS avg_rating
	FROM authors a
    JOIN books b
    ON a.authorid = b.authorid
    JOIN reviews r
    ON b.bookid = r.bookid
    WHERE b.genre = 'Historical Fiction'
    GROUP BY a.authorid, a.authorname, b.title
)

SELECT authorname, title ,avg_rating
FROM cte 
WHERE avg_rating >= 4;


-- Q2. List all books and their authors, including books that have not received any reviews. If there is no review, display a NULL in the rating column.
SELECT 
  b.Title, 
  a.AuthorName, 
  r.Rating
FROM Books b
LEFT JOIN Authors a 
  ON b.AuthorID = a.AuthorID
LEFT JOIN Reviews r 
  ON b.BookID = r.BookID;


-- Q3. Identify each genre’s highest-rated book and display the genre, book title, author name, and highest rating. Use RANK() to rank books by rating within each genre.
WITH cte AS (
    SELECT b.Genre, 
          b.Title, 
          a.AuthorName, 
          r.Rating,
          RANK() OVER (PARTITION BY b.Genre ORDER BY r.Rating DESC) AS GenreRank
    FROM Books b
    JOIN Reviews r 
        ON b.BookID = r.BookID
    JOIN Authors a 
        ON b.AuthorID = a.AuthorID
)
SELECT Genre, 
      Title, 
      AuthorName, 
      Rating
FROM cte
WHERE GenreRank = 1;
