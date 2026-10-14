
USE CollegeDB;


DROP TABLE IF EXISTS Student;
CREATE TABLE Student (
    Student_ID INT PRIMARY KEY,
    First_Name VARCHAR(50),
    Last_Name VARCHAR(50),
    Name VARCHAR(100),
    Age INT,
    Course VARCHAR(50),
    City VARCHAR(50)
);

INSERT INTO Student VALUES
    (1, 'Lakshay', 'Saini', 'Lakshay Saini', 19, 'B.Tech', 'Haridwar'),
    (2, 'Rahul', 'Sharma', 'Rahul Sharma', 20, 'BCA', 'Meerut'),
    (3, 'Priya', 'Verma', 'Priya Verma', 19, 'B.Tech', 'Dehradun'),
    (4, 'Amit', 'Kumar', 'Amit Kumar', 21, 'MBA', 'Delhi'),
    (5, 'Neha', 'Gupta', 'Neha Gupta', 20, 'BBA', 'Roorkee');

DROP TABLE IF EXISTS Employee;
CREATE TABLE Employee (
    Emp_ID INT PRIMARY KEY,
    Emp_Name VARCHAR(100),
    Department VARCHAR(50),
    Salary DECIMAL(10,2),
    Joining_Date DATE
);

INSERT INTO Employee VALUES
    (101, 'Ravi', 'IT', 50000.75, '2022-03-15'),
    (102, 'Sneha', 'HR', 42500.40, '2021-07-01'),
    (103, 'Arjun', 'Finance', 45250.55, '2023-01-10'),
    (104, 'Meena', 'IT', 60000.25, '2020-11-25'),
    (105, 'Deepak', 'HR', 35500.90, '2024-05-05');

SELECT * FROM Student;
SELECT * FROM Employee;



-- Q1. ABS()  (absolute value)
SELECT ABS(-15) AS Abs_Negative, ABS(25) AS Abs_Positive, ABS(-7.5) AS Abs_Decimal;
SELECT Emp_Name, Salary, ABS(Salary - 50000) AS Diff_From_50000 FROM Employee;

-- Q2. ROUND()
SELECT ROUND(123.456) AS R0, ROUND(123.456, 2) AS R2, ROUND(123.456, -1) AS R_Minus1;

-- Q3. CEIL() and FLOOR()
SELECT CEIL(4.2) AS Ceil_4_2, FLOOR(4.8) AS Floor_4_8,
       CEIL(-4.2) AS Ceil_Neg, FLOOR(-4.8) AS Floor_Neg;
SELECT Emp_Name, Salary, CEIL(Salary) AS Salary_Ceil, FLOOR(Salary) AS Salary_Floor FROM Employee;

-- Q4. MOD()
SELECT MOD(10, 3) AS Mod_10_3, MOD(17, 5) AS Mod_17_5, 10 % 4 AS Using_Percent;
SELECT Name, Age, MOD(Age, 2) AS Remainder FROM Student;   -- 0 = even, 1 = odd

-- Q5. Rounded salary of employees
SELECT Emp_Name, Salary, ROUND(Salary) AS Rounded_Salary,
       ROUND(Salary, -2) AS Rounded_To_Hundreds
FROM Employee;



-- Q6. COUNT()
SELECT COUNT(*) AS Total_Students FROM Student;

-- Q7. SUM()
SELECT SUM(Salary) AS Total_Salary FROM Employee;

-- Q8. AVG()
SELECT AVG(Salary) AS Average_Salary, ROUND(AVG(Salary), 2) AS Average_Rounded FROM Employee;

-- Q9. MAX()
SELECT MAX(Salary) AS Highest_Salary FROM Employee;

-- Q10. MIN()
SELECT MIN(Salary) AS Lowest_Salary FROM Employee;



-- Q11. UPPER()
SELECT Name, UPPER(Name) AS Upper_Name FROM Student;

-- Q12. LOWER()
SELECT Name, LOWER(Name) AS Lower_Name FROM Student;

-- Q13. LENGTH()  (MySQL mein bytes ginta hai; characters ke liye CHAR_LENGTH)
SELECT Name, LENGTH(Name) AS Name_Length, CHAR_LENGTH(Name) AS Char_Count FROM Student;

-- Q14. CONCAT()
SELECT First_Name, Last_Name, CONCAT(First_Name, ' ', Last_Name) AS Full_Name FROM Student;

-- Q15. SUBSTRING() / SUBSTR()
SELECT Name,
       SUBSTRING(Name, 1, 3) AS First_3_Letters,
       SUBSTR(Name, 5) AS From_5th_Letter,
       SUBSTRING(Name, -5) AS Last_5_Letters
FROM Student;



-- Q16. Number into character/string
SELECT CAST(1234 AS CHAR) AS Num_To_String,
       CONCAT('Salary: ', Salary) AS Auto_Convert
FROM Employee;

-- Q17. String into numeric
SELECT CAST('123' AS UNSIGNED) AS Str_To_Int,
       CAST('45.50' AS DECIMAL(10,2)) AS Str_To_Decimal,
       '100' + 50 AS Auto_Convert_Add;

-- Q18. Date into a different format
SELECT CURDATE() AS Default_Format,
       DATE_FORMAT(CURDATE(), '%d-%m-%Y') AS DD_MM_YYYY,
       DATE_FORMAT(CURDATE(), '%W, %d %M %Y') AS Long_Format;
SELECT STR_TO_DATE('15-08-2025', '%d-%m-%Y') AS String_To_Date;

-- Q19. CAST()
SELECT CAST('2026-10-13' AS DATE) AS As_Date,
       CAST('99' AS UNSIGNED) AS As_Int,
       CAST(45.789 AS DECIMAL(5,1)) AS As_Decimal;
SELECT Emp_Name, Salary, CAST(Salary AS SIGNED) AS Salary_As_Int,
       CAST(Salary AS CHAR) AS Salary_As_Text
FROM Employee;

-- Q20. CONVERT()
SELECT CONVERT('456', SIGNED) AS Str_To_Int,
       CONVERT(789, CHAR) AS Int_To_Str,
       CONVERT('2026-10-13', DATE) AS To_Date,
       CONVERT('Hello' USING utf8mb4) AS Charset_Convert;



-- Q21. Current date
SELECT CURDATE() AS Today, CURRENT_DATE() AS Today2, NOW() AS Date_And_Time;

-- Q22. Extract year, month and day
SELECT Emp_Name, Joining_Date,
       YEAR(Joining_Date) AS Year_Part,
       MONTH(Joining_Date) AS Month_Part,
       MONTHNAME(Joining_Date) AS Month_Name,
       DAY(Joining_Date) AS Day_Part
FROM Employee;

-- Q23. Difference between two dates
SELECT DATEDIFF('2026-12-31', '2026-10-13') AS Days_Between;
SELECT TIMESTAMPDIFF(MONTH, '2026-01-01', '2026-10-13') AS Months_Between;
SELECT Emp_Name, Joining_Date,
       DATEDIFF(CURDATE(), Joining_Date) AS Days_In_Company,
       TIMESTAMPDIFF(YEAR, Joining_Date, CURDATE()) AS Years_In_Company
FROM Employee;

-- Q24. Add a number of days to a date
SELECT CURDATE() AS Today,
       DATE_ADD(CURDATE(), INTERVAL 30 DAY) AS After_30_Days,
       ADDDATE(CURDATE(), 7) AS After_7_Days,
       DATE_SUB(CURDATE(), INTERVAL 10 DAY) AS Before_10_Days;

-- Q25. Employees' joining dates in a required format
SELECT Emp_Name,
       DATE_FORMAT(Joining_Date, '%d-%m-%Y') AS DD_MM_YYYY,
       DATE_FORMAT(Joining_Date, '%d %M %Y') AS Long_Format,
       DATE_FORMAT(Joining_Date, '%b %e, %Y') AS Short_Month
FROM Employee;