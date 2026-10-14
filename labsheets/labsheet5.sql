USE CollegeDB;

DROP TABLE IF EXISTS Student;
DROP TABLE IF EXISTS Employee;
DROP TABLE IF EXISTS Department;
DROP TABLE IF EXISTS Course;

CREATE TABLE Department (
    Dept_ID INT PRIMARY KEY,
    Dept_Name VARCHAR(50),
    Location VARCHAR(50)
);
INSERT INTO Department VALUES
    (1, 'IT', 'Block A'),
    (2, 'HR', 'Block B'),
    (3, 'Finance', 'Block C'),
    (4, 'Admin', 'Block D');

CREATE TABLE Course (
    Course_ID INT PRIMARY KEY,
    Course_Name VARCHAR(100),
    Duration VARCHAR(30),
    Fees DECIMAL(10,2)
);
INSERT INTO Course VALUES
    (1, 'B.Tech', '4 Years', 120000),
    (2, 'BCA', '3 Years', 60000),
    (3, 'MBA', '2 Years', 150000),
    (4, 'BBA', '3 Years', 70000);

CREATE TABLE Student (
    Student_ID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Age INT,
    Dept_ID INT,
    Course_ID INT,
    City VARCHAR(50)
);
INSERT INTO Student VALUES
    (1, 'Lakshay', 19, 1, 1, 'Haridwar'),
    (2, 'Rahul', 20, 1, 2, 'Meerut'),
    (3, 'Priya', 19, 2, 1, 'Dehradun'),
    (4, 'Amit', 21, 3, 3, 'Delhi'),
    (5, 'Neha', 20, 2, 4, 'Delhi'),
    (6, 'Rohit', 22, 1, 2, 'Roorkee'),
    (7, 'Simran', 19, NULL, 3, 'Delhi');

CREATE TABLE Employee (
    Emp_ID INT PRIMARY KEY,
    Emp_Name VARCHAR(100),
    Dept_ID INT,
    Salary DECIMAL(10,2),
    Manager_ID INT
);
INSERT INTO Employee VALUES
    (101, 'Ravi', 1, 50000, NULL),
    (102, 'Sneha', 2, 42000, 101),
    (103, 'Arjun', 3, 45000, 101),
    (104, 'Meena', 1, 55000, 101),
    (105, 'Deepak', 2, 30000, 102),
    (106, 'Rekha', 4, 38000, 103);

-- Q1. INNER JOIN between Student and Department
SELECT * FROM Student s INNER JOIN Department d ON s.Dept_ID = d.Dept_ID;

-- Q2. Student names with department names using INNER JOIN
SELECT s.Name, d.Dept_Name FROM Student s INNER JOIN Department d ON s.Dept_ID = d.Dept_ID;

-- Q3. Employee names with department names
SELECT e.Emp_Name, d.Dept_Name FROM Employee e INNER JOIN Department d ON e.Dept_ID = d.Dept_ID;

-- Q4. Students along with their course details
SELECT s.Name, c.Course_Name, c.Duration, c.Fees
FROM Student s INNER JOIN Course c ON s.Course_ID = c.Course_ID;

-- Q5. Students of a particular department using INNER JOIN
SELECT s.Name, d.Dept_Name
FROM Student s INNER JOIN Department d ON s.Dept_ID = d.Dept_ID
WHERE d.Dept_Name = 'IT';

-- Q6. LEFT OUTER JOIN between Student and Department
SELECT s.Name, d.Dept_Name FROM Student s LEFT JOIN Department d ON s.Dept_ID = d.Dept_ID;

-- Q7. All students, including those without a matching department
SELECT s.Student_ID, s.Name, COALESCE(d.Dept_Name, 'Not Assigned') AS Department
FROM Student s LEFT JOIN Department d ON s.Dept_ID = d.Dept_ID;

-- Q8. RIGHT OUTER JOIN between Student and Department
SELECT s.Name, d.Dept_Name FROM Student s RIGHT JOIN Department d ON s.Dept_ID = d.Dept_ID;

-- Q9. All departments, including departments having no students
SELECT d.Dept_Name, s.Name
FROM Department d LEFT JOIN Student s ON d.Dept_ID = s.Dept_ID
ORDER BY d.Dept_ID;

-- Q10. Students not assigned to any department using LEFT JOIN
SELECT s.Student_ID, s.Name
FROM Student s LEFT JOIN Department d ON s.Dept_ID = d.Dept_ID
WHERE d.Dept_ID IS NULL;

-- Q11. Departments having no students
SELECT d.Dept_ID, d.Dept_Name
FROM Department d LEFT JOIN Student s ON d.Dept_ID = s.Dept_ID
WHERE s.Student_ID IS NULL;
SELECT d.Dept_ID, d.Dept_Name
FROM Student s RIGHT JOIN Department d ON s.Dept_ID = d.Dept_ID
WHERE s.Student_ID IS NULL;

-- Q12. FULL OUTER JOIN using LEFT JOIN UNION RIGHT JOIN
SELECT s.Name, d.Dept_Name FROM Student s LEFT JOIN Department d ON s.Dept_ID = d.Dept_ID
UNION
SELECT s.Name, d.Dept_Name FROM Student s RIGHT JOIN Department d ON s.Dept_ID = d.Dept_ID;

-- Q13. CROSS JOIN between Student and Course
SELECT s.Name, c.Course_Name FROM Student s CROSS JOIN Course c;

-- Q14. Number of possible Student-Course combinations
SELECT COUNT(*) AS Total_Combinations FROM Student CROSS JOIN Course;

-- Q15. NATURAL JOIN between Student and Department
SELECT * FROM Student NATURAL JOIN Department;

-- Q16. Compare NATURAL JOIN and INNER JOIN
SELECT * FROM Student NATURAL JOIN Department;
SELECT * FROM Student s INNER JOIN Department d ON s.Dept_ID = d.Dept_ID;

-- Q17. SELF JOIN on Employee for employee-manager relationship
SELECT e.Emp_Name AS Employee, m.Emp_Name AS Manager
FROM Employee e INNER JOIN Employee m ON e.Manager_ID = m.Emp_ID;

-- Q18. Employees along with their managers using SELF JOIN
SELECT e.Emp_ID, e.Emp_Name AS Employee, COALESCE(m.Emp_Name, 'No Manager') AS Manager
FROM Employee e LEFT JOIN Employee m ON e.Manager_ID = m.Emp_ID;

-- Q19. Join three tables: Student, Department and Course
SELECT * FROM Student s
INNER JOIN Department d ON s.Dept_ID = d.Dept_ID
INNER JOIN Course c ON s.Course_ID = c.Course_ID;

-- Q20. Student name, course name and department name using multiple joins
SELECT s.Name, c.Course_Name, d.Dept_Name
FROM Student s
INNER JOIN Course c ON s.Course_ID = c.Course_ID
INNER JOIN Department d ON s.Dept_ID = d.Dept_ID;

-- Q21. Employees earning more than the average salary of their department
SELECT e.Emp_Name, d.Dept_Name, e.Salary, ROUND(a.Avg_Salary, 2) AS Dept_Avg_Salary
FROM Employee e
INNER JOIN (SELECT Dept_ID, AVG(Salary) AS Avg_Salary FROM Employee GROUP BY Dept_ID) a
    ON e.Dept_ID = a.Dept_ID
INNER JOIN Department d ON e.Dept_ID = d.Dept_ID
WHERE e.Salary > a.Avg_Salary;

-- Q22. Department having the maximum number of students
SELECT d.Dept_Name, COUNT(s.Student_ID) AS Total_Students
FROM Department d INNER JOIN Student s ON d.Dept_ID = s.Dept_ID
GROUP BY d.Dept_Name
ORDER BY Total_Students DESC
LIMIT 1;

-- Q23. Departments and total number of students in each
SELECT d.Dept_Name, COUNT(s.Student_ID) AS Total_Students
FROM Department d LEFT JOIN Student s ON d.Dept_ID = s.Dept_ID
GROUP BY d.Dept_Name;

-- Q24. Courses along with number of students enrolled
SELECT c.Course_Name, COUNT(s.Student_ID) AS Students_Enrolled
FROM Course c LEFT JOIN Student s ON c.Course_ID = s.Course_ID
GROUP BY c.Course_Name;

-- Q25. Student-department-course report using INNER JOIN, LEFT JOIN, GROUP BY and aggregates
SELECT COALESCE(d.Dept_Name, 'Not Assigned') AS Department,
       c.Course_Name AS Course,
       COUNT(s.Student_ID) AS Total_Students,
       ROUND(AVG(s.Age), 1) AS Average_Age,
       SUM(c.Fees) AS Total_Fees
FROM Student s
INNER JOIN Course c ON s.Course_ID = c.Course_ID
LEFT JOIN Department d ON s.Dept_ID = d.Dept_ID
GROUP BY d.Dept_Name, c.Course_Name
ORDER BY Department, Course;