-- ============================================
-- DBMS LAB
-- PROGRAM 02-3
-- MCA Department, St. Francis College
-- SQLite Compatible
-- ============================================

PRAGMA foreign_keys = ON;

-- =================================================
-- 3. DEPARTMENTS LOCATED IN MORE THAN ONE LOCATION
-- =================================================
SELECT dno,
       COUNT(*) AS Location_Count
FROM Dept_Locations
GROUP BY dno
HAVING COUNT(*) > 1;

-- =================================================
-- 4. RENAME COLUMN DNUMBER TO DNO
-- (Already renamed in previous step if executed once)
-- =================================================
-- Execute ONLY if not already renamed
-- ALTER TABLE Dept_Locations RENAME COLUMN dnumber TO dno;

-- =================================================
-- 5. DEPARTMENT(S) LOCATED IN MAXIMUM LOCATIONS
-- =================================================
SELECT d.dname
FROM Department d
WHERE d.dnum = (
    SELECT dno
    FROM Dept_Locations
    GROUP BY dno
    HAVING COUNT(*) = (
        SELECT MAX(cnt)
        FROM (
            SELECT COUNT(*) AS cnt
            FROM Dept_Locations
            GROUP BY dno
        )
    )
);

-- =================================================
-- 6. COUNT LOCATIONS FOR EACH DEPARTMENT
-- =================================================
SELECT dno,
       COUNT(*) AS Location_Count
FROM Dept_Locations
GROUP BY dno;

-- =================================================
-- 7. DELETE ONE RECORD AND ROLLBACK
-- =================================================

BEGIN TRANSACTION;

DELETE FROM Dept_Locations
WHERE dno = '5';

-- VERIFY DELETE
SELECT * FROM Dept_Locations;

-- ROLLBACK OPERATION
ROLLBACK;

-- VERIFY ROLLBACK
SELECT * FROM Dept_Locations;
