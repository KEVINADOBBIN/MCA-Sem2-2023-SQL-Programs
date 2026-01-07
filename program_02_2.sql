-- ============================================
-- DBMS LAB
-- PROGRAM 02-2
-- MCA Department, St. Francis College
-- SQLite Compatible
-- ============================================

PRAGMA foreign_keys = ON;

-- =================================================
-- 3. RENAME COLUMN DNUMBER TO DNUM IN DEPARTMENT
-- =================================================
ALTER TABLE Department RENAME COLUMN dnumber TO dnum;

-- =================================================
-- 4. EMPLOYEES BORN AFTER 31-DEC-1990
-- =================================================
SELECT *
FROM Employee
WHERE bdate > '1990-12-31';

-- =================================================
-- 5. DEPARTMENT-WISE NUMBER OF EMPLOYEES
-- =================================================
SELECT dno,
       COUNT(*) AS Employee_Count
FROM Employee
GROUP BY dno;

-- =================================================
-- 6. EMPLOYEE GETTING HIGHEST SALARY
-- =================================================
SELECT *
FROM Employee
WHERE salary = (
    SELECT MAX(salary)
    FROM Employee
);

-- =================================================
-- 7. FEMALE EMPLOYEE NAME, DEPARTMENT NAME, SALARY
-- =================================================
SELECT e.fname,
       e.lname,
       d.dname,
       e.salary
FROM Employee e
JOIN Department d
ON e.dno = d.dnum
WHERE e.gender = 'F';

-- =================================================
-- 8(a). EMPLOYEES CONTROLLED BY DEPARTMENT NO. 5
--      (USING EXISTS)
-- =================================================
SELECT e.fname,
       e.lname
FROM Employee e
WHERE EXISTS (
    SELECT 1
    FROM Department d
    WHERE d.dnum = '5'
      AND d.mgssn = e.super_ssn
);

-- =================================================
-- 8(b). DEPARTMENTS HAVING AT LEAST 2 EMPLOYEES
-- =================================================
SELECT d.dname,
       COUNT(e.dno) AS Employee_Count
FROM Employee e
JOIN Department d
ON e.dno = d.dnum
GROUP BY d.dname
HAVING COUNT(e.dno) >= 2;
