-- ==========================================
-- DBMS LAB : PROGRAM 04
-- Database : SQLite
-- ==========================================

DROP TABLE IF EXISTS Students;

-- ==========================================
-- CREATE TABLE
-- ==========================================

CREATE TABLE Students (
    usn TEXT PRIMARY KEY,
    name TEXT,
    dob DATE,
    branch TEXT,
    marks1 INTEGER,
    marks2 INTEGER,
    marks3 INTEGER,
    total INTEGER,
    gpa REAL
);

-- ==========================================
-- INSERT DATA
-- ==========================================

INSERT INTO Students VALUES
('1001','Archana','2002-02-02','Arts',62,73,84,NULL,NULL),
('1002','Baldev','2003-03-03','Commerce',76,65,54,NULL,NULL),
('1003','Chaitali','2001-01-01','Science',75,86,64,NULL,NULL),
('1004','Dheeraj','2000-04-20','Arts',85,75,65,NULL,NULL),
('1005','Isra','2001-05-26','Commerce',77,66,88,NULL,NULL),
('1006','Omkar','2003-10-14','Science',98,87,89,NULL,NULL),
('1007','Simar','2002-03-26','Arts',88,77,66,NULL,NULL),
('1008','Tanmay','2003-06-20','Commerce',89,78,77,NULL,NULL),
('1009','Yasmin','2001-10-10','Science',94,83,81,NULL,NULL);

-- ==========================================
-- 7(a) CALCULATE GPA
-- ==========================================

UPDATE Students
SET gpa = ROUND((marks1 + marks2 + marks3) / 30.0, 2);

-- ==========================================
-- 7(b) STUDENTS BORN IN A PARTICULAR YEAR (2001)
-- ==========================================

SELECT * FROM Students
WHERE strftime('%Y', dob) = '2001';

-- ==========================================
-- 8(a) STUDENTS FROM A PARTICULAR BRANCH (Arts)
-- ==========================================

SELECT * FROM Students
WHERE branch = 'Arts';

-- ==========================================
-- 8(b) MAX GPA BRANCH-WISE
-- ==========================================

SELECT branch, MAX(gpa) AS max_gpa
FROM Students
GROUP BY branch;

-- ==========================================
-- 9(a) STUDENTS WHOSE NAME STARTS WITH 'S'
-- ==========================================

SELECT * FROM Students
WHERE name LIKE 'S%';

-- ==========================================
-- 9(b) UPDATE TOTAL MARKS
-- ==========================================

UPDATE Students
SET total = marks1 + marks2 + marks3;

-- ==========================================
-- 10(a) STUDENTS WHOSE NAME ENDS WITH 'AR'
-- ==========================================

SELECT * FROM Students
WHERE name LIKE '%ar';

-- ==========================================
-- 10(b) DELETE STUDENT WITH USN = 1001
-- ==========================================

DELETE FROM Students
WHERE usn = '1001';

-- ==========================================
-- FINAL TABLE
-- ==========================================

SELECT * FROM Students;
