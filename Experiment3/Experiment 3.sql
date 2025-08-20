create database exp3;

use exp3;

-- Easy Task
-- Generate employee relation with only 1 attribute (  ID )
-- Find the max id but excluding the duplicates

create table employees_tbl(
    e_id int
);

insert into employees_tbl values
(1),
(1),
(2),
(3),
(3),
(4),
(5),
(5),
(6),
(7),
(7);

select max(a.e_id) as max_distinct_id from (select e_id, count(e_id) as id_cnt from employees_tbl group by e_id) as a where a.id_cnt = 1;



---- Task 2:
-- select product which has not been sold once
-- find the total quantity of sold for each respective product
CREATE TABLE TBL_PRODUCTS
(
	ID INT PRIMARY KEY IDENTITY,
	[NAME] NVARCHAR(50),
	[DESCRIPTION] NVARCHAR(250)
)

CREATE TABLE TBL_PRODUCTSALES
(
	ID INT PRIMARY KEY IDENTITY,
	PRODUCTID INT FOREIGN KEY REFERENCES TBL_PRODUCTS(ID),
	UNITPRICE INT,
	QUALTITYSOLD INT
)

INSERT INTO TBL_PRODUCTS VALUES ('TV','52 INCH BLACK COLOR LCD TV')
INSERT INTO TBL_PRODUCTS VALUES ('LAPTOP','VERY THIIN BLACK COLOR ACER LAPTOP')
INSERT INTO TBL_PRODUCTS VALUES ('DESKTOP','HP HIGH PERFORMANCE DESKTOP')


INSERT INTO TBL_PRODUCTSALES VALUES (3,450,5)
INSERT INTO TBL_PRODUCTSALES VALUES (2,250,7)
INSERT INTO TBL_PRODUCTSALES VALUES (3,450,4)
INSERT INTO TBL_PRODUCTSALES VALUES (3,450,9)

select * from TBL_PRODUCTS
select * from TBL_PRODUCTSALES
select * from TBL_PRODUCTS where TBL_PRODUCTS.ID not in (select distinct PRODUCTID from TBL_PRODUCTSALES);

select Name, (select SUM(TBL_PRODUCTSALES.QUALTITYSOLD) from TBL_PRODUCTSALES where PRODUCTID = TBL_PRODUCTS.ID) as [PRODUCT SALES] from TBL_PRODUCTS;