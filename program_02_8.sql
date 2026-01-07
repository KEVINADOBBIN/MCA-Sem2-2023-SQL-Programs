-- =====================================================
-- DBMS LAB
-- PROGRAM 02-8
-- MCA Department, St. Francis College
-- SQLite Compatible
-- =====================================================

PRAGMA foreign_keys = ON;

-- =====================================================
-- 3. DISPLAY EMPLOYEE NAME WITH THEIR DEPENDENT NAMES
-- =====================================================
SELECT e.fname,
       e.lname,
       d.dependent_name
FROM Employee e
JOIN Dependent d
ON e.ssn = d.essn;

-- =====================================================
-- 4. DISPLAY DETAILS OF EMPLOYEE EARNING HIGHEST SALARY
-- =====================================================
SELECT *
FROM Employee
WHERE salary = (SELECT MAX(salary) FROM Employee);

-- =====================================================
-- 5. DISPLAY THE AVERAGE SALARY IN THE COMPANY
-- =====================================================
SELECT AVG(salary) AS Average_Salary
FROM Employee;

-- =====================================================
-- 6. DISPLAY NUMBER OF EMPLOYEES STAYING IN NYC
-- =====================================================
SELECT address,
       COUNT(*) AS No_of_Employees
FROM Employee
WHERE address = 'NYC'
GROUP BY address;

-- =====================================================
-- 7. GIVE 5% INCREMENT TO EMPLOYEES WITH SALARY < 6000
-- =====================================================
UPDATE Employee
SET salary = salary + (salary * 0.05)
WHERE salary < 6000;

-- =====================================================
-- VERIFY UPDATED EMPLOYEE TABLE
-- =====================================================
SELECT *
FROM Employee;
