CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    StudentName VARCHAR(100),
    Email VARCHAR(100),
    EnrollmentDate DATE
);

INSERT INTO Students (StudentID, StudentName, Email, EnrollmentDate) VALUES
(1, 'Alice Johnson', 'alice.j@example.com', '2023-01-15'),
(2, 'Bob Smith', 'bob.smith@edu.org', '2022-09-12'),
(3, 'Charlie Brown', 'charlie_brown@univ.edu', '2021-06-25'),
(4, 'David White', 'david.white@school.ac.in', '2023-03-10'),
(5, 'Eva Green', 'eva.green@learn.edu', '2022-11-01');


CREATE TABLE Courses (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(100),
    Category VARCHAR(50),
    DurationMonths INT
);

INSERT INTO Courses (CourseID, CourseName, Category, DurationMonths) VALUES
(101, 'Data Science', 'Technology', 6),
(102, 'Digital Marketing', 'Marketing', 4),
(103, 'Graphic Design', 'Design', 3),
(104, 'AI & Machine Learning', 'Technology', 8),
(105, 'Business Analytics', 'Business', 5);


CREATE TABLE Enrollments (
    EnrollmentID INT PRIMARY KEY,
    StudentID INT,
    CourseID INT,
    Grade VARCHAR(2),
    Status VARCHAR(20),
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);

INSERT INTO Enrollments (EnrollmentID, StudentID, CourseID, Grade, Status) VALUES
(201, 1, 101, 'A', 'Completed'),
(202, 2, 102, 'B', 'Ongoing'),
(203, 3, 103, 'A', 'Completed'),
(204, 4, 104, 'C', 'Ongoing'),
(205, 5, 105, 'B', 'Completed'),
(206, 1, 104, 'A', 'Ongoing'),
(207, 2, 105, 'B+', 'Completed');


-- Q1. Identify students with email domains from .edu and .ac.in. Display the student name, email, and extracted domain. Sort the results alphabetically by domain.
SELECT 
    StudentName, 
    Email, 
    SUBSTR(Email, INSTR(Email, '@') + 1) AS Domain
FROM Students
WHERE Email REGEXP '\\.(edu|ac\\.in)$'
ORDER BY Domain;


-- Q2. Find courses with names containing either 'Data' or 'Design' in them. Display the course name, category, and indicate whether they belong to the 'Technology' or 'Design' categories using a case-insensitive REGEXP check.
SELECT 
    CourseName, 
    Category,
    CASE
        WHEN CourseName REGEXP '(?i)data' THEN 'Technology Related'
        WHEN CourseName REGEXP '(?i)design' THEN 'Design Related'
        ELSE 'Other'
    END AS Classification
FROM Courses
WHERE CourseName REGEXP '(?i)(data|design)';


-- Q3. Identify students who have scored an 'A' grade in any course but exclude those with 'Ongoing' status. Display their name, course name, and a masked email (replace the first part with '*').**
WITH MaskedEmails AS (
    SELECT 
        s.StudentName,
        c.CourseName,
        CONCAT('***', SUBSTR(s.Email, INSTR(s.Email, '@'))) AS MaskedEmail,
        e.Grade,
        e.Status
    FROM Students s
    JOIN Enrollments e ON s.StudentID = e.StudentID
    JOIN Courses c ON e.CourseID = c.CourseID
    WHERE e.Grade = 'A' AND e.Status != 'Ongoing'
)
SELECT StudentName, 
      CourseName, 
      MaskedEmail
FROM MaskedEmails;




