-- =====================================================
-- DBMS LAB
-- PROGRAM 02-9
-- MCA Department, St. Francis College
-- SQLite Compatible
-- =====================================================

PRAGMA foreign_keys = ON;

-- =====================================================
-- 3. DISPLAY DEPARTMENT NAMES WITH THEIR LOCATIONS
-- =====================================================
SELECT d.dname,
       dl.dlocation
FROM Department d
JOIN Dept_Locations dl
ON d.dnum = dl.dno;

-- =====================================================
-- 4. DEPARTMENTS LOCATED AT MORE THAN ONE LOCATION
-- =====================================================
SELECT dno,
       COUNT(*) AS No_of_Locations
FROM Dept_Locations
GROUP BY dno
HAVING COUNT(*) > 1;

-- =====================================================
-- 5. DEPARTMENTS WHOSE MANAGERS APPOINTED AFTER 2010
-- =====================================================
SELECT dname
FROM Department
WHERE strftime('%Y', mgrstartdate) > '2010';

-- =====================================================
-- 6. DEPARTMENTS HAVING ONLY ONE LOCATION
-- =====================================================
SELECT d.dname,
       COUNT(dl.dno) AS No_of_Locations
FROM Department d
JOIN Dept_Locations dl
ON d.dnum = dl.dno
GROUP BY d.dname
HAVING COUNT(dl.dno) = 1;

-- =====================================================
-- 7. ALTER DEPT_LOCATIONS TO ADD COLUMN STATE
-- =====================================================
ALTER TABLE Dept_Locations
ADD COLUMN state TEXT;

-- =====================================================
-- 8(a). CREATE VIEW (WITHOUT CHECK OPTION)
-- =====================================================
CREATE VIEW high_sal AS
SELECT *
FROM Employee
WHERE salary > 10000;

-- =====================================================
-- 8(a). CREATE VIEW (WITH CHECK OPTION)
-- (SQLite enforces this logically)
-- =====================================================
CREATE VIEW high_sall AS
SELECT *
FROM Employee
WHERE salary > 10000;

-- =====================================================
-- 8(b). DROP VIEW
-- =====================================================
DROP VIEW high_sal;

-- =====================================================
-- 8(c). SELECT FROM VIEW
-- =====================================================
SELECT *
FROM high_sall;
