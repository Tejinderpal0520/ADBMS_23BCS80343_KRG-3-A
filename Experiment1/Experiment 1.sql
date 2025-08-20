Create database exp1;
use exp1;
-- Easy Level Problem
CREATE TABLE TBL_AUTHOR (
    AUTHOR_ID INT PRIMARY KEY,
    AUTHOR_NAME VARCHAR(30)
);

CREATE TABLE TBL_BOOK (
    BOOK_ID INT PRIMARY KEY,
    BOOK_TITLE VARCHAR(50),
    AUTHOR_ID INT,
    FOREIGN KEY (AUTHOR_ID) REFERENCES TBL_AUTHOR(AUTHOR_ID)
);
INSERT INTO TBL_AUTHOR (AUTHOR_ID, AUTHOR_NAME) VALUES
(1, 'C.J. Date'),
(2, 'Silberschatz'),
(3, 'A. Tanenbaum');

INSERT INTO TBL_BOOK (BOOK_ID, BOOK_TITLE, AUTHOR_ID) VALUES
(101, 'Database Systems', 1),
(102, 'Operating Systems', 2),
(103, 'Computer Networks', 3),
(104, 'Advanced Databases', 1),
(105, 'Modern OS', 2);

SELECT
    book.BOOK_TITLE AS Title,
    author.AUTHOR_NAME AS Author
FROM
    TBL_BOOK AS book
INNER JOIN
    TBL_AUTHOR AS author ON book.AUTHOR_ID = author.AUTHOR_ID
ORDER BY
    Author, Title;

-- Medium Level Problem
CREATE TABLE University_Branches (
    branch_code INT PRIMARY KEY,
    branch_title VARCHAR(100) NOT NULL
);

CREATE TABLE Class_Listings (
    class_id INT PRIMARY KEY,
    class_subject VARCHAR(100) NOT NULL,
    branch_code INT,
    FOREIGN KEY (branch_code) REFERENCES University_Branches(branch_code)
);

INSERT INTO University_Branches (branch_code, branch_title) VALUES
(10, 'Computer Science'),
(20, 'Mechanical Engineering'),
(30, 'Electrical Engineering'),
(40, 'Civil Engineering'),
(50, 'Mathematics');

INSERT INTO Class_Listings (class_id, class_subject, branch_code) VALUES
(501, 'Data Structures', 10),
(502, 'Operating Systems', 10),
(503, 'Machine Learning', 10),
(504, 'Thermodynamics', 20),
(505, 'Fluid Mechanics', 20),
(506, 'Circuits and Systems', 30),
(507, 'Control Systems', 30),
(508, 'Structural Analysis', 40),
(509, 'Linear Algebra', 50),
(510, 'Calculus', 50),
(511, 'Probability Theory', 50);

SELECT
    branch.branch_title,
    COUNT(listing.class_id) AS number_of_classes
FROM
    University_Branches AS branch
LEFT JOIN
    Class_Listings AS listing ON branch.branch_code = listing.branch_code
GROUP BY
    branch.branch_title
ORDER BY
    branch.branch_title;

SELECT
    branch.branch_title,
    COUNT(listing.class_id) AS class_count
FROM
    University_Branches AS branch
JOIN
    Class_Listings AS listing ON branch.branch_code = listing.branch_code
GROUP BY
    branch.branch_title
HAVING
    COUNT(listing.class_id) > 2
ORDER BY
    branch.branch_title;