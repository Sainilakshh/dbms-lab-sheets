
-- Q1. Create database CollegeDB
CREATE DATABASE IF NOT EXISTS CollegeDB;
USE CollegeDB;
SHOW DATABASES;

-- Q2. Student table
DROP TABLE IF EXISTS Student;
CREATE TABLE Student (
    Student_ID INT,
    Name VARCHAR(100),
    Age INT,
    Course VARCHAR(50),
    City VARCHAR(50)
);
DESCRIBE Student;

-- Q3. Employee table
DROP TABLE IF EXISTS Employee;
CREATE TABLE Employee (
    Emp_ID INT,
    Emp_Name VARCHAR(100),
    Department VARCHAR(50),
    Salary DECIMAL(10,2)
);
DESCRIBE Employee;

-- Q4. Department table
DROP TABLE IF EXISTS Department;
CREATE TABLE Department (
    Dept_ID INT,
    Dept_Name VARCHAR(50),
    Location VARCHAR(50)
);
DESCRIBE Department;

-- Q5. Product table
DROP TABLE IF EXISTS Product;
CREATE TABLE Product (
    Product_ID INT,
    Product_Name VARCHAR(100),
    Price DECIMAL(10,2),
    Quantity INT
);
DESCRIBE Product;

-- Q6. Customer table
DROP TABLE IF EXISTS Customer;
CREATE TABLE Customer (
    Customer_ID INT,
    Customer_Name VARCHAR(100),
    Email VARCHAR(100),
    Phone VARCHAR(15)
);
DESCRIBE Customer;

-- Q7. Course table
DROP TABLE IF EXISTS Course;
CREATE TABLE Course (
    Course_ID INT,
    Course_Name VARCHAR(100),
    Duration VARCHAR(30),
    Fees DECIMAL(10,2)
);
DESCRIBE Course;

-- Q8. Faculty table
DROP TABLE IF EXISTS Faculty;
CREATE TABLE Faculty (
    Faculty_ID INT,
    Faculty_Name VARCHAR(100),
    Subject VARCHAR(50),
    Salary DECIMAL(10,2)
);
DESCRIBE Faculty;

-- Q9. Library table
DROP TABLE IF EXISTS Library;
CREATE TABLE Library (
    Book_ID INT,
    Book_Name VARCHAR(100),
    Author VARCHAR(100),
    Price DECIMAL(8,2)
);
DESCRIBE Library;

-- Q10. Department table with Dept_ID as PRIMARY KEY
DROP TABLE IF EXISTS Department;
CREATE TABLE Department (
    Dept_ID INT PRIMARY KEY,
    Dept_Name VARCHAR(50),
    Location VARCHAR(50)
);
DESCRIBE Department;

-- Q11. Student table with Student_ID PRIMARY KEY and Name NOT NULL
DROP TABLE IF EXISTS Student;
CREATE TABLE Student (
    Student_ID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Age INT,
    Course VARCHAR(50),
    City VARCHAR(50)
);
DESCRIBE Student;

-- Q12. Employee table with UNIQUE constraint on Email
--      (Salary yahan nahi rakha, Q19 mein ALTER se add hoga)
DROP TABLE IF EXISTS Employee;
CREATE TABLE Employee (
    Emp_ID INT PRIMARY KEY,
    Emp_Name VARCHAR(100),
    Email VARCHAR(100) UNIQUE,
    Department VARCHAR(50)
);
DESCRIBE Employee;

-- Q13. Product table with CHECK (Price > 0)
DROP TABLE IF EXISTS Product;
CREATE TABLE Product (
    Product_ID INT PRIMARY KEY,
    Product_Name VARCHAR(100),
    Price DECIMAL(10,2) CHECK (Price > 0),
    Quantity INT
);
DESCRIBE Product;

-- Q14. Add Email column to Student
ALTER TABLE Student ADD Email VARCHAR(100);
DESCRIBE Student;

-- Q15. Add Phone column to Student
ALTER TABLE Student ADD Phone VARCHAR(15);
DESCRIBE Student;

-- Q16. Modify datatype/size of Name column
ALTER TABLE Student MODIFY Name VARCHAR(150) NOT NULL;
DESCRIBE Student;

-- Q17. Rename Student table to Student_Details
RENAME TABLE Student TO Student_Details;
SHOW TABLES;

-- Q18. Rename column City to Address
ALTER TABLE Student_Details RENAME COLUMN City TO Address;
DESCRIBE Student_Details;

-- Q19. Add Salary column to Employee
ALTER TABLE Employee ADD Salary DECIMAL(10,2);
DESCRIBE Employee;

-- Q20. Drop Phone column
ALTER TABLE Student_Details DROP COLUMN Phone;
DESCRIBE Student_Details;

-- Q21. Drop Email column
ALTER TABLE Student_Details DROP COLUMN Email;
DESCRIBE Student_Details;

-- Q22. TRUNCATE (pehle data daalte hain, phir saaf)
INSERT INTO Product VALUES (1, 'Pen', 10.00, 100);
INSERT INTO Product VALUES (2, 'Notebook', 50.00, 40);
SELECT * FROM Product;
TRUNCATE TABLE Product;
SELECT * FROM Product;

-- Q23. Drop Course table
DROP TABLE Course;
SHOW TABLES;

-- Q24. Drop Customer table
DROP TABLE Customer;
SHOW TABLES;

-- Q25. Complete Student table (PK, NOT NULL, UNIQUE, CHECK) + ALTER + DROP
--      (naam Student_Demo rakha taaki upar wali tables se na takraye)
DROP TABLE IF EXISTS Student_Demo;
CREATE TABLE Student_Demo (
    Student_ID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE,
    Age INT CHECK (Age >= 17),
    Course VARCHAR(50),
    City VARCHAR(50)
);
DESCRIBE Student_Demo;

-- ALTER operations
ALTER TABLE Student_Demo ADD Phone VARCHAR(15);
ALTER TABLE Student_Demo MODIFY City VARCHAR(80);
ALTER TABLE Student_Demo RENAME COLUMN City TO Address;
DESCRIBE Student_Demo;

-- DROP operations
ALTER TABLE Student_Demo DROP COLUMN Phone;
DESCRIBE Student_Demo;
DROP TABLE Student_Demo;
SHOW TABLES;