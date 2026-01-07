-- =====================================================
-- DBMS LAB
-- PROGRAM 02-7
-- MCA Department, St. Francis College
-- SQLite Compatible
-- =====================================================

PRAGMA foreign_keys = ON;

-- =====================================================
-- 6. DISPLAY PROJECTS ON WHICH MORE THAN 2 EMPLOYEES WORK
-- =====================================================
SELECT pno,
       COUNT(*) AS No_of_Employees
FROM Works_on
GROUP BY pno
HAVING COUNT(*) > 2;

-- =====================================================
-- 7. PROJECT NUMBER, PROJECT NAME AND NUMBER OF EMPLOYEES
--    (PROJECTS WITH MORE THAN 2 EMPLOYEES)
-- =====================================================
SELECT w.pno,
       p.pname,
       COUNT(*) AS No_of_Employees
FROM Works_on w
JOIN Project p
ON w.pno = p.pnum
GROUP BY w.pno, p.pname
HAVING COUNT(*) > 2;

-- =====================================================
-- 3. EMPLOYEE NAMES ALONG WITH PROJECTS THEY WORK ON
-- =====================================================
SELECT e.fname,
       e.lname,
       p.pname
FROM Employee e
JOIN Works_on w
ON e.ssn = w.essn
JOIN Project p
ON w.pno = p.pnum;

-- =====================================================
-- 4. COUNT OF PROJECTS EACH EMPLOYEE IS WORKING ON
-- =====================================================
SELECT e.fname,
       e.lname,
       COUNT(w.pno) AS No_of_Projects
FROM Employee e
JOIN Works_on w
ON e.ssn = w.essn
GROUP BY e.fname, e.lname;

-- =====================================================
-- 5. PROJECT-WISE NUMBER OF EMPLOYEES
-- =====================================================
SELECT pno,
       COUNT(*) AS No_of_Employees
FROM Works_on
GROUP BY pno;
