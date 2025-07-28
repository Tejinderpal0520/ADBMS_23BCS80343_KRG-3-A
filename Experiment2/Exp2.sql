CREATE DATABASE KRG_3a;
use KRG_3a;

            /* EASY LEVEL PROBLEM*/
/*

Easy-Level Problem

Problem Title: Author-Book Relationship Using Joins and Basic SQL Operations
Procedure (Step-by-Step):
Design two tables one for storing author details and the other for book details.

Ensure a foreign key relationship from the book to its respective author.

Insert at least three records in each table.

Perform an INNER JOIN to link each book with its author using the common author ID.

Select the book title, author name, and author's country.

Sample Output Description:

When the join is performed, we get a list where each book 
title is shown along with its author's name and their country.
*/


--          BASE TABLE 
CREATE TABLE TBL_AUTHORS(
AUTHOR_ID int PRIMARY KEY,
AUTHOR_NAME VARCHAR(MAX),
AUTHOR_COUNTRY VARCHAR(MAX)
)

--          CHILD TABLE
CREATE TABLE TBL_BOOKS(
    BOOK_ID INT PRIMARY KEY,
    BOOK_TITLE VARCHAR(MAX),
    AUTHORID INT,
    FOREIGN KEY (AUTHORID) REFERENCES TBL_AUTHORS(AUTHOR_ID)
);

INSERT INTO TBL_AUTHORS(AUTHOR_ID, AUTHOR_NAME, AUTHOR_COUNTRY) VALUES 
(101, 'Tarun', 'India'),
(102, 'Nepolean', 'England'), 
(103, 'Shiv Kumar', 'India');

INSERT INTO TBL_BOOKS(BOOK_ID, BOOK_TITLE, AUTHORID) VALUES
(1, 'DSA', 101), 
(2, 'Think and grow rich', 102), 
(3, 'Milange Jrur', 103);

SELECT 
    TBL_BOOKS.BOOK_TITLE,
    TBL_AUTHORS.AUTHOR_NAME,
    TBL_AUTHORS.AUTHOR_COUNTRY
FROM 
    TBL_AUTHORS
INNER JOIN 
    TBL_BOOKS 
ON 
    TBL_AUTHORS.AUTHOR_ID = TBL_BOOKS.AUTHORID;



            /* MEDIUM LEVEL PROBLEM */

/*
Problem Title: Department-Course Subquery and Access Control
Procedure (Step-by-Step):

Design normalized tables for departments and the courses they offer, maintaining a foreign key relationship.

Insert five departments and at least ten courses across those departments.

Use a subquery to count the number of courses under each department.

Filter and retrieve only those departments that offer more than two courses.

Grant SELECT-only access on the courses table to a specific user.

Sample Output Description:

The result shows the names of departments which are associated with more than two courses in the system.
*/

CREATE TABLE Department (
    DeptID INT PRIMARY KEY,
    DeptName VARCHAR(100)
);

-- Create Course Table
CREATE TABLE Course (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(100),
    DeptID INT,
    FOREIGN KEY (DeptID) REFERENCES Department(DeptID)
);

-- Insert Departments
INSERT INTO Department VALUES
(1, 'Computer Science'),
(2, 'Physics'),
(3, 'Mathematics'),
(4, 'Chemistry'),
(5, 'Biology');


-- Insert Course
INSERT INTO Course VALUES
(101, 'Data Structures', 1),
(102, 'Operating Systems', 1),
(103, 'Quantum Mechanics', 2),
(104, 'Electromagnetism', 2),
(105, 'Linear Algebra', 3),
(106, 'Calculus', 3),
(107, 'Organic Chemistry', 4),
(108, 'Physical Chemistry', 4),
(109, 'Genetics', 5),
(110, 'Molecular Biology', 5);
INSERT INTO Course VALUES (111, 'Engineering Chemistry', 5);

SELECT DeptName 
from Department 
WHERE DeptID IN (
    SELECT DeptID 
    FROM Course 
    GROUP BY DeptID 
    HAVING COUNT(*) > 2
);

-- CREATING ADMIN
CREATE LOGIN Inder_1 WITH PASSWORD = 'Inder123'

--CREATING USER
CREATE USER Inder FOR LOGIN Inder_1;

-- LOGINING TO Inder
EXECUTE AS USER = 'Inder';

-- GIVING SELECT ACCESS
GRANT SELECT ON Department TO Inder;

-- REVOKING SELECT ACCESS FORM Inder
REVOKE SELECT ON Department FROM Inder;