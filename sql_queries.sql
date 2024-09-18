Create database db_name; -- Creates a database
Create database if not exists db_name; -- Creates database if it didn't exist before
drop database db_name; -- deletes a database
drop database if exists db_name; -- deletes the database if it exists
show databases; -- Display all databases in the server
use data_base1; -- Connected to data_base1
Create Table faculty(
    ID VARCHAR(30) primary key,
    NAME VARCHAR(30),
    DEPARTMENT VARCHAR(10),
    SALARY INT
    -- primary key(ID)
); -- Create a table named faculty and set 'ID' as primary key
-- We can write the primary key at the end of the table also
-- NOT NULL make sure that if nothing is entered , will throw an error
-- Tuple refers to a row , attribute refers to a column , relation refers to a table
drop table faculties; -- Delete the table named faculties
show tables; -- Displays the tables in the current database
insert into faculty values('F330','Shirsendu Das','CSE',90000);
select * From faculty;
Delete from faculty;
Delete from faculty where ID='F330';
Update  faculty set NAME='Dr. Shirsendu Das' where ID='F330';
Create Table students(
    ID VARCHAR(20) primary key,
    NAME VARCHAR(10) not null,
    DEPARTMENT VARCHAR(10),
    MENTOR_ID VARCHAR(20),
    foreign key (MENTOR_ID) references faculty(ID) 
 );


-- Primary key should not be NULL
-- not null ensures that NAME attribute cannot contain NULL values
-- ID(primary key of faculty table) of faculty table is referenced as the foreign key of the Students table(MENTOR_ID)
on delete null
on delete cascade
col2 int UNIQUE -- ensures that col2 has all values that are distinct
col2 int DEFAULT 2000 -- Sets the default value to 2000 if nothing is entered in that

CREATE TABLE Products (
    ProductID int,
    Price decimal(10, 2),
    Quantity int,
    CHECK (Price > 0 AND Quantity >= 0)
);
--The CHECK constraint ensures that the price is always positive and the quantity is never negative.



insert into students values('11020','RISHITHA','AI','F330');
insert into students values ('11021','Naveen kumar pothala','CSE','F330'),('11023','Sailada yeswanth','CSE','F331');
SELECT * FROM students , faculty where mentor_id=='F3330';
SELECT * FROM students, faculty WHERE students.MENTOR_ID = faculty.ID;

-- 5+NULL = NULL , Here NULL means unknown
-- Database schema means the structure the database
-- Any set of attributes that can uniquely identify a row is called super key.
-- The minimum sub set of super key , that can uniquely idenifty a row is called candidate key

/*
   Say different departments has faculty with same id's then we will combine two attributes(Here id and department) and refer it as primary key
*/

alter table r add A D; -- Add attributes A,D to the table r
alter table r drop A; -- Delete attribute A from the table r

select department from faculty; 
select distinct department from faculty; -- eliminates the duplicates with same department and give the data

select salary*1.1 from faculty;
-- <> represents not equal

/* Basic Data types
 1. Char(n) -> string of n length
 2. varchar(n)  -> string of max n length
 3.int
 4.smallint
 5.numeric(p,d) -> consists p digits and d of the p are right to decimal point
 6.real,double precision
 7.float(n)
*/

-- Types of SQL Commands
/*
 1. DDL (Data Definition Language): Create , alter , rename , truncate & drop
 2. DQL (Data Query Language): Select
 3. DML(Data Manipulation Language):    , insert , update & delete
 4. DCL (Data control Language): grant & revoke permission to users
 5. TCL(Transaction Control Language): Start trasaction,commit,rollback
*/

-- Where Clause
/*
 + , - , * , / , AND ,OR , BETWEEN ,IN , NOT
*/
SELECT * from Student WHERE marks BETWEEN 80 AND 90;
SELECT * FROM Student WHERE city IN ("Delhi","Mumbai");
SELECT * FROM Student WHERE city NOT IN ("Delhi","Mumbai");

--Limit clause
--sets an upper limit on the number of (tuples)rows to be returned

SELECT * FROM Student LIMIT 3;
SELECT * FROM Student WHERE marks>60 LIMIT 3;

-- Order by Clause
--To sort in ascending or descending order

SELECT * FROM student ORDER BY marks ASC;
SELECT * FROM student ORDER BY marks DESC;


-- Aggregate functions
-- Performs a calculation on a set of values , and return a single value

COUNT() , MAX() , MIN() , SUM() , AVG()

SELECT max(marks) from Student; -- get max marks
SELECT avg(marks) from student; -- get average marks
SELECT COUNT(rollno) FROM student; -- number of students in the class

-- Group By clause
-- It collects data from multiple records and groups the result by one or more column
SELECT city , count(rollno) FROM student GROUP BY city ; -- Counter number of students in each city
--Generally we use group by clause by some aggregation function

SELECT city , name , count(rollno) FROM student GROUP BY city; --Throws an error
SELECT city , name , count(rollno) FROM student GROUP BY city , name; --group by city and name


-- Having clause
-- similar to where i.e applies some condition on rows.

SELECT count(name) , city FROM student GROUP BY city HAVING max(marks)>90;
-- here , max(marks) of city is compared, if we use where it compares each student marks . So we can't achieve it with where

--General order

SELECT column(s)
FROM table_name
WHERE condition
GROUP BY column(s)
HAVING condition
ORDER by column(s) ASC;

--update operation

UPDATE table_name 
SET col1 = val1 , col2 = val2
WHERE condition;

UPDATE student
SET grade="A"
WHERE id="11020";

-- FOREIGN KEYS

/*
Cascading for foriegn keys:
  on Delete Cascade:
    When we create a foreign key using this option , it deletes the referencing rows in the child table when the referenced row is deleted in the parent table which has a primary key.
  on Update Cascade:
    When we create a foreign key using UPDATE CASCADE the referencing rows are updated in the child table when the referenced row is updated in the parent table which has a primary key

*/

CREATE TABLE Student(
    id INT PRIMARY KEY,
    FOREIGN KEY (Course_Id) REFERENCES Course(id),
    ON UPDATE CASCADE,
    ON DELETE CASCADE,
);


-- Alter(to change schema)

-- ADD Column
ALTER TABLE table_name ADD COLUMN column_name datatype constraint;
ALTER TABLE Student ADD COLUMN age INT NOT NULL DEFAULT 19;

-- Drop Column
ALTER TABLE table_name DROP COLUMN column_name;
ALTER TABLE Student DROP COLUMN age;

-- Rename Table
ALTER TABLE table_name RENAME TO new_table_name;
ALTER TABLE Student RENAME TO Student_details;

-- Change Column
ALTER TABLE table_name CHANGE COLUMN old_name new_name new_datatype new_constraint;
ALTER TABLE Student CHANGE age stud_age INT;

-- Modify Column
ALTER TABLE table_name MODIFY col_name new_datatype new_constraint;
ALTER TABLE Student CHANGE age stud_age INT;

--  Truncate (To delete table's data)
TRUNCATE TABLE Student; -- similar to "delete from table_name"

-- JOINS
/*
JOIN IS USED TO COMBINE ROWS FROM TWO OR MORE TABLES , BASED ON A RELATED COLUMN BETWEEN THEM
Types of joins:
   1. INNER JOIN
     Returns the intersection of the two tables
   2. LEFT JOIN
   3. RIGHT JOIN
   4. FULL JOIN

*/

-- INNER JOIN

SELECT column(s) FROM tableA INNER JOIN tableB ON table.col_name = tableB.col_name;


-- LEFT JOIN
-- Returns all records from the left table(tableA) , and the matched records from the right table
SELECT column(s) FROM tableA LEFT JOIN tableB ON tableA.col_name = tableB.col_name;

-- Right Join
-- Returns all records from the right table(tableB), and the matched records from the left table

SELECT column(s) FROM tableA RIGHT JOIN tableB ON tableA.col_name = tableB.col_name

-- FULL JOIN
--Returns all records when there is a match in either left or right table
--No direct command

SELECT * FROM Student as a
LEFT JOIN Course as b
ON a.id = b.id --left join
UNION          -- union
SELECT * FROM Student as a  -- right join
RIGHT JOIN course as b
ON a.id = b.id;

-- self join
--It is a regular join but table is joined with itself

-- UNION
-- USED TO COMBINE THE RESULT-SET OF TWO or More SELECT Statements
-- gives Unique Records

/*
To use it:
   Every SELECT should have same no.of columns
   Columns must have similar data types
   Columns in every SELECT should be in same order
*/

SELECT column(s) From tableA
UNION 
SELECT column(S) From tableB

