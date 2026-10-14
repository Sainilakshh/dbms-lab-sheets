USE CollegeDB;

DROP TABLE IF EXISTS Student;
CREATE TABLE Student (
    Student_ID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Age INT,
    Course VARCHAR(50),
    City VARCHAR(50)
);
INSERT INTO Student VALUES
    (1, 'Lakshay', 19, 'B.Tech', 'Haridwar'),
    (2, 'Rahul', 20, 'BCA', 'Meerut'),
    (3, 'Priya', 19, 'B.Tech', 'Dehradun'),
    (4, 'Amit', 21, 'MBA', 'Delhi'),
    (5, 'Neha', 20, 'BBA', 'Delhi'),
    (6, 'Rohit', 22, 'B.Tech', NULL);

DROP TABLE IF EXISTS Alumni;
CREATE TABLE Alumni (
    Alumni_ID INT PRIMARY KEY,
    Name VARCHAR(100),
    City VARCHAR(50)
);
INSERT INTO Alumni VALUES
    (1, 'Rahul', 'Meerut'),
    (2, 'Karan', 'Roorkee'),
    (3, 'Neha', 'Delhi'),
    (4, 'Simran', 'Delhi');

DROP TABLE IF EXISTS Employee;
CREATE TABLE Employee (
    Emp_ID INT PRIMARY KEY,
    Emp_Name VARCHAR(100),
    Department VARCHAR(50),
    Salary DECIMAL(10,2)
);
INSERT INTO Employee VALUES
    (101, 'Ravi', 'IT', 50000),
    (102, 'Sneha', 'HR', 42000),
    (103, 'Arjun', 'Finance', 45000),
    (104, 'Meena', 'IT', 60000),
    (105, 'Deepak', 'HR', 30000),
    (106, 'Rekha', 'Admin', 38000);

DROP TABLE IF EXISTS Product;
CREATE TABLE Product (
    Product_ID INT PRIMARY KEY,
    Product_Name VARCHAR(100),
    Price DECIMAL(10,2),
    Quantity INT
);
INSERT INTO Product VALUES
    (1, 'Pen', 10, 100),
    (2, 'Notebook', 50, 40),
    (3, 'Bag', 500, 15),
    (4, 'Marker', 30, 25),
    (5, 'Calculator', 800, 10);

-- Q1. Addition using +
SELECT 25 + 15 AS Addition;

-- Q2. Subtraction using -
SELECT 25 - 15 AS Subtraction;

-- Q3. Multiplication using *
SELECT 25 * 15 AS Multiplication;

-- Q4. Division using /
SELECT 25 / 5 AS Division;

-- Q5. Total amount = Price x Quantity
SELECT Product_Name, Price, Quantity, Price * Quantity AS Total_Amount FROM Product;

-- Q6. AND with two conditions
SELECT * FROM Student WHERE Age > 19 AND City = 'Delhi';

-- Q7. OR with two conditions
SELECT * FROM Student WHERE Age = 19 OR City = 'Delhi';

-- Q8. NOT with a condition
SELECT * FROM Student WHERE NOT Course = 'B.Tech';

-- Q9. Students of a specific course AND city
SELECT * FROM Student WHERE Course = 'B.Tech' AND City = 'Haridwar';

-- Q10. Employees belonging to either of two departments
SELECT * FROM Employee WHERE Department = 'IT' OR Department = 'HR';

-- Q11. = operator
SELECT * FROM Student WHERE Course = 'BCA';

-- Q12. > operator
SELECT * FROM Employee WHERE Salary > 45000;

-- Q13. < operator
SELECT * FROM Employee WHERE Salary < 45000;

-- Q14. >= and <=
SELECT * FROM Student WHERE Age >= 20;
SELECT * FROM Student WHERE Age <= 20;

-- Q15. <> and != operators
SELECT * FROM Student WHERE Course <> 'B.Tech';
SELECT * FROM Student WHERE Course != 'B.Tech';

-- Q16. BETWEEN for salary range
SELECT * FROM Employee WHERE Salary BETWEEN 40000 AND 50000;

-- Q17. IN for multiple cities
SELECT * FROM Student WHERE City IN ('Delhi', 'Meerut', 'Haridwar');

-- Q18. NOT IN
SELECT * FROM Student WHERE City NOT IN ('Delhi', 'Meerut');

-- Q19. LIKE for names beginning with a letter
SELECT * FROM Student WHERE Name LIKE 'R%';

-- Q20. IS NULL and IS NOT NULL
SELECT * FROM Student WHERE City IS NULL;
SELECT * FROM Student WHERE City IS NOT NULL;

-- Q21. UNION
SELECT City FROM Student
UNION
SELECT City FROM Alumni;

-- Q22. UNION ALL
SELECT City FROM Student
UNION ALL
SELECT City FROM Alumni;

-- Q23. INTERSECT
SELECT Name FROM Student
INTERSECT
SELECT Name FROM Alumni;

-- Q24. EXCEPT
SELECT Name FROM Student
EXCEPT
SELECT Name FROM Alumni;

-- Q25. Multiple operators together
SELECT Emp_Name, Department, Salary, Salary * 12 AS Annual_Salary
FROM Employee
WHERE Department IN ('IT', 'HR')
  AND Salary BETWEEN 40000 AND 60000
  AND Emp_Name NOT LIKE 'D%'
  AND Salary * 12 > 500000;