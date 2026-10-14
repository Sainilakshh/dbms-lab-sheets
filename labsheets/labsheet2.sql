USE CollegeDB;
SET SQL_SAFE_UPDATES = 0;   
DROP TABLE IF EXISTS Student;
CREATE TABLE Student (
    Student_ID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Age INT,
    Course VARCHAR(50),
    City VARCHAR(50)
);

DROP TABLE IF EXISTS Employee;
CREATE TABLE Employee (
    Emp_ID INT PRIMARY KEY,
    Emp_Name VARCHAR(100),
    Department VARCHAR(50),
    Salary DECIMAL(10,2)
);

DROP TABLE IF EXISTS Department;
CREATE TABLE Department (
    Dept_ID INT PRIMARY KEY,
    Dept_Name VARCHAR(50),
    Location VARCHAR(50)
);

DROP TABLE IF EXISTS Product;
CREATE TABLE Product (
    Product_ID INT PRIMARY KEY,
    Product_Name VARCHAR(100),
    Price DECIMAL(10,2) CHECK (Price > 0),
    Quantity INT
);

DROP TABLE IF EXISTS Customer;
CREATE TABLE Customer (
    Customer_ID INT PRIMARY KEY,
    Customer_Name VARCHAR(100),
    Email VARCHAR(100),
    Phone VARCHAR(15)
);

DROP TABLE IF EXISTS Course;
CREATE TABLE Course (
    Course_ID INT PRIMARY KEY,
    Course_Name VARCHAR(100),
    Duration VARCHAR(30),
    Fees DECIMAL(10,2)
);

-- Q1. Insert one record into Student
INSERT INTO Student VALUES (1, 'Lakshay', 19, 'B.Tech', 'Haridwar');
SELECT * FROM Student;

-- Q2. Insert five records using separate INSERT statements
INSERT INTO Student VALUES (2, 'Rahul', 20, 'BCA', 'Meerut');
INSERT INTO Student VALUES (3, 'Priya', 19, 'B.Tech', 'Dehradun');
INSERT INTO Student VALUES (4, 'Amit', 21, 'MBA', 'Meerut');
INSERT INTO Student VALUES (5, 'Neha', 20, 'BBA', 'Delhi');
INSERT INTO Student VALUES (6, 'Karan', 22, 'B.Tech', 'Roorkee');
SELECT * FROM Student;

-- Q3. Insert multiple records using a single statement
INSERT INTO Student VALUES
    (7, 'Simran', 19, 'BCA', 'Delhi'),
    (8, 'Rohit', 20, 'MBA', 'Meerut'),
    (9, 'Anjali', 21, 'B.Tech', 'Haridwar');
SELECT * FROM Student;

-- Q4. Insert records into Employee
INSERT INTO Employee VALUES
    (101, 'Ravi', 'IT', 50000),
    (102, 'Sneha', 'HR', 40000),
    (103, 'Arjun', 'Finance', 45000),
    (104, 'Meena', 'IT', 60000),
    (105, 'Deepak', 'HR', 30000);
SELECT * FROM Employee;

-- Q5. Insert records into Department
INSERT INTO Department VALUES
    (1, 'IT', 'Block A'),
    (2, 'HR', 'Block B'),
    (3, 'Finance', 'Block C'),
    (4, 'Admin', 'Block D');
SELECT * FROM Department;

-- Q6. Insert records into Product
INSERT INTO Product VALUES
    (1, 'Pen', 10.00, 100),
    (2, 'Notebook', 50.00, 40),
    (3, 'Bag', 500.00, 0),
    (4, 'Marker', 30.00, 25),
    (5, 'Calculator', 800.00, 0);
SELECT * FROM Product;

-- Q7. Insert records into Customer
INSERT INTO Customer VALUES
    (1, 'Aman Verma', 'aman@gmail.com', '9876543210'),
    (2, 'Kavita Sharma', 'kavita@gmail.com', '9812345678'),
    (3, 'Sahil Gupta', 'sahil@gmail.com', '9900112233');
SELECT * FROM Customer;

-- Q8. Insert records into Course
INSERT INTO Course VALUES
    (1, 'B.Tech', '4 Years', 120000),
    (2, 'BCA', '3 Years', 60000),
    (3, 'MBA', '2 Years', 150000),
    (4, 'BBA', '3 Years', 70000);
SELECT * FROM Course;

-- Q9. Insert a student record with values for ALL columns
INSERT INTO Student (Student_ID, Name, Age, Course, City)
VALUES (10, 'Vikas', 22, 'BBA', 'Dehradun');
SELECT * FROM Student WHERE Student_ID = 10;

-- Q10. Insert a student record with ONLY selected columns
--      (baaki columns NULL rahenge; Name NOT NULL hai isliye dena zaroori)
INSERT INTO Student (Student_ID, Name, Course)
VALUES (11, 'Pooja', 'BCA');
SELECT * FROM Student WHERE Student_ID = 11;

-- ============================================================
-- UPDATE
-- ============================================================

-- Q11. Update the city of a particular student
UPDATE Student SET City = 'Roorkee' WHERE Student_ID = 11;
SELECT * FROM Student WHERE Student_ID = 11;

-- Q12. Update the salary of a particular employee
UPDATE Employee SET Salary = 42000 WHERE Emp_ID = 102;
SELECT * FROM Employee;

-- Q13. Increase salary of all employees by 10%
UPDATE Employee SET Salary = Salary * 1.10;
SELECT * FROM Employee;

-- Q14. Increase price of all products by 5%
UPDATE Product SET Price = Price * 1.05;
SELECT * FROM Product;

-- Q15. Change the course of a particular student
UPDATE Student SET Course = 'BCA' WHERE Student_ID = 3;
SELECT * FROM Student WHERE Student_ID = 3;

-- Q16. Update the department of an employee
UPDATE Employee SET Department = 'IT' WHERE Emp_ID = 103;
SELECT * FROM Employee WHERE Emp_ID = 103;

-- Q17. Update city of all students from Meerut to Delhi
UPDATE Student SET City = 'Delhi' WHERE City = 'Meerut';
SELECT * FROM Student;

-- Q18. Update the fees of a particular course
UPDATE Course SET Fees = 130000 WHERE Course_Name = 'B.Tech';
SELECT * FROM Course;

-- Q19. Update multiple columns of a student simultaneously
UPDATE Student
SET Age = 21, Course = 'MBA', City = 'Noida'
WHERE Student_ID = 5;
SELECT * FROM Student WHERE Student_ID = 5;


-- Q20. Delete a particular student using Student_ID
DELETE FROM Student WHERE Student_ID = 6;
SELECT * FROM Student;

-- Q21. Delete all students belonging to a particular city
DELETE FROM Student WHERE City = 'Dehradun';
SELECT * FROM Student;

-- Q22. Delete employees whose salary is below a specified amount
DELETE FROM Employee WHERE Salary < 35000;
SELECT * FROM Employee;

-- Q23. Delete products whose quantity is zero
DELETE FROM Product WHERE Quantity = 0;
SELECT * FROM Product;

-- Q24. Delete records satisfying multiple conditions using AND/OR
DELETE FROM Student
WHERE (Age > 20 AND Course = 'MBA') OR City = 'Roorkee';
SELECT * FROM Student;

-- Q25. Complete INSERT -> UPDATE -> DELETE sequence on a Student
--      table, table display ke saath har step ke baad
--      (alag table Student_Seq, taaki upar ka data na bigde)

DROP TABLE IF EXISTS Student_Seq;
CREATE TABLE Student_Seq (
    Student_ID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Age INT,
    Course VARCHAR(50),
    City VARCHAR(50)
);

-- Step 1: INSERT
INSERT INTO Student_Seq VALUES
    (1, 'Lakshay', 19, 'B.Tech', 'Haridwar'),
    (2, 'Rahul', 20, 'BCA', 'Meerut'),
    (3, 'Priya', 19, 'B.Tech', 'Dehradun'),
    (4, 'Amit', 21, 'MBA', 'Meerut');
SELECT * FROM Student_Seq;      -- after INSERT

-- Step 2: UPDATE
UPDATE Student_Seq SET City = 'Delhi' WHERE City = 'Meerut';
UPDATE Student_Seq SET Age = 20 WHERE Student_ID = 1;
SELECT * FROM Student_Seq;      -- after UPDATE

-- Step 3: DELETE
DELETE FROM Student_Seq WHERE Student_ID = 3;
SELECT * FROM Student_Seq;      -- after DELETE