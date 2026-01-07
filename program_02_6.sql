-- =====================================================
-- DBMS LAB
-- PROGRAM 02-6
-- MCA Department, St. Francis College
-- SQLite Compatible
-- =====================================================

PRAGMA foreign_keys = ON;

-- =====================================================
-- 3. SUM, MAX, MIN, AVG SALARY OF 'ACCOUNTS' DEPARTMENT
-- =====================================================
SELECT d.dname AS Department,
       SUM(e.salary) AS Total_Salary,
       MAX(e.salary) AS Max_Salary,
       MIN(e.salary) AS Min_Salary,
       AVG(e.salary) AS Average_Salary
FROM Employee e
JOIN Department d
ON e.dno = d.dnum
WHERE d.dname = 'Accounts'
GROUP BY d.dname;

-- =====================================================
-- 4. DEPARTMENTS HAVING AT LEAST 2 EMPLOYEES
-- =====================================================
SELECT d.dname AS Department,
       COUNT(e.ssn) AS No_of_Employees
FROM Employee e
JOIN Department d
ON e.dno = d.dnum
GROUP BY d.dnum, d.dname
HAVING COUNT(e.ssn) >= 2;

-- =====================================================
-- 5. DEPARTMENT-WISE NUMBER OF EMPLOYEES
-- =====================================================
SELECT d.dname AS Department,
       COUNT(e.ssn) AS No_of_Employees
FROM Employee e
JOIN Department d
ON e.dno = d.dnum
GROUP BY d.dname;

-- =====================================================
-- 6. EMPLOYEES BORN IN THE 1990s
-- =====================================================
SELECT fname,
       lname
FROM Employee
WHERE bdate BETWEEN '1990-01-01' AND '1999-12-31';

-- =====================================================
-- 7. SAVE THE UPDATES
-- =====================================================
COMMIT;

-- =====================================================
-- 8. DEPARTMENTS WITH >2 EMPLOYEES
--    AND COUNT EMPLOYEES EARNING > 6500
-- =====================================================
SELECT dno,
       COUNT(*) AS Employees_Above_6500
FROM Employee
WHERE salary > 6500
  AND dno IN (
      SELECT dno
      FROM Employee
      GROUP BY dno
      HAVING COUNT(*) > 2
  )
GROUP BY dno;
