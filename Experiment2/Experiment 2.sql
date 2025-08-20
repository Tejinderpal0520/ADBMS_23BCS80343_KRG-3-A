CREATE DATABASE exp2;

USE exp2;


-------- Task 1
CREATE TABLE Employee (
    EmpID INT PRIMARY KEY,
    EmpName VARCHAR(50) NOT NULL,
    Department VARCHAR(50) NOT NULL,
    ManagerID INT NULL
);


ALTER TABLE Employee
ADD CONSTRAINT FK_Manager FOREIGN KEY (ManagerID) REFERENCES Employee(EmpID);


INSERT INTO Employee (EmpID, EmpName, Department, ManagerID)
VALUES
(1, 'Alice', 'HR', NULL),        -- Top-level manager
(2, 'Bob', 'Finance', 1),
(3, 'Charlie', 'IT', 1),
(4, 'David', 'Finance', 2),
(5, 'Eve', 'IT', 3),
(6, 'Frank', 'HR', 1);

select
    e.EmpName,
    e.Department,
    m.EmpName as [MANAGER NAME],
    m.Department as [MANAGER Department]
from Employee as m
right join Employee as e
on  e.ManagerID = m.EmpID;


------ Task 2
create table year_tbl(
    id int,
    year int,
    npv int not null,
    primary key (id, year)
);

create table queries_tbl(
    id int,
    year int,
    primary key (id, year)
);

insert into year_tbl(id, year, npv) values
(1, 2018,  100),
(7, 2020,  30),
(13, 2019,  40),
(1, 2019,  113),
(2, 2008,  121),
(3, 2009,  12),
(11, 2020,  99),
(7, 2019,  0);

insert  into queries_tbl(id, year) values
(1, 2019),
(2, 2008),
(3, 2009),
(7, 2018),
(7, 2019),
(7, 2020),
(13, 2019);

select q.id, q.year, ISNULL(yt.npv, 0) as npv
from queries_tbl as q
left join year_tbl yt
on q.year = yt.year and q.id = yt.id;