-- ============================================
-- DBMS LAB
-- PROGRAM 02-4
-- MCA Department, St. Francis College
-- SQLite Compatible
-- ============================================

PRAGMA foreign_keys = ON;

-- =================================================
-- 3. DISPLAY SSN NUMBERS WITH PROJECT NAMES
-- =================================================
SELECT w.essn,
       p.pname
FROM Works_On w
JOIN Project p
ON w.pno = p.pnum;

-- =================================================
-- 4. PROJECT-WISE TOTAL NUMBER OF HOURS WORKED
-- =================================================
SELECT p.pname,
       SUM(w.hours) AS Total_Hours
FROM Project p
JOIN Works_On w
ON p.pnum = w.pno
GROUP BY p.pname;

-- =================================================
-- 5. ADD COLUMN 'CITY' TO WORKS_ON TABLE
-- =================================================
ALTER TABLE Works_On
ADD COLUMN city TEXT;

-- =================================================
-- 6. NUMBER OF EMPLOYEES WORKING ON EACH PROJECT
-- =================================================
SELECT p.pname,
       COUNT(w.essn) AS No_of_Employees
FROM Project p
JOIN Works_On w
ON p.pnum = w.pno
GROUP BY p.pname;

-- =================================================
-- 7. DELETE RECORDS OF EMPLOYEE 145 FROM WORKS_ON
-- =================================================
DELETE FROM Works_On
WHERE essn = '145';

-- VERIFY DELETE
SELECT * FROM Works_On;

-- =================================================
-- 8. PROJECT NUMBER, NAME AND EMPLOYEE COUNT
-- =================================================
SELECT p.pnum,
       p.pname,
       COUNT(w.essn) AS Employee_Count
FROM Project p
JOIN Works_On w
ON p.pnum = w.pno
GROUP BY p.pnum, p.pname;
