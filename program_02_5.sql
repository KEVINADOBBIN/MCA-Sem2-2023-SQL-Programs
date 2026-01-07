-- ============================================
-- DBMS LAB
-- PROGRAM 02-5
-- MCA Department, St. Francis College
-- SQLite Compatible
-- ============================================

PRAGMA foreign_keys = ON;

-- =================================================
-- 3. EMPLOYEE NAMES WITH THEIR DEPENDENT NAMES
-- =================================================
SELECT e.fname,
       e.lname,
       d.dependent_name
FROM Employee e
JOIN Dependent d
ON e.ssn = d.essn;

-- =================================================
-- 4. EMPLOYEES WHO DO NOT HAVE DEPENDENTS
-- =================================================
SELECT e.fname,
       e.lname
FROM Employee e
WHERE NOT EXISTS (
    SELECT 1
    FROM Dependent d
    WHERE d.essn = e.ssn
);

-- =================================================
-- 5. COUNT NUMBER OF DEPENDENTS FOR EACH EMPLOYEE
-- =================================================
SELECT e.fname,
       e.lname,
       COUNT(d.dependent_name) AS No_of_Dependents
FROM Employee e
JOIN Dependent d
ON e.ssn = d.essn
GROUP BY e.fname, e.lname;

-- =================================================
-- 6. EMPLOYEES BORN IN THE 1990s
-- =================================================
SELECT fname,
       lname
FROM Employee
WHERE bdate BETWEEN '1990-01-01' AND '1999-12-31';

-- =================================================
-- 7. COUNT MALE AND FEMALE DEPENDENTS
-- =================================================
SELECT sex,
       COUNT(*) AS No_of_Dependents
FROM Dependent
GROUP BY sex;
