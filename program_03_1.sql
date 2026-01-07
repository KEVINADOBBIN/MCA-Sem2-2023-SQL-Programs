-- ================================
-- DBMS LAB : PROGRAM 03
-- Database : SQLite
-- ================================

-- DROP TABLES (to avoid errors if re-run)
DROP TABLE IF EXISTS Borrow;
DROP TABLE IF EXISTS Book;
DROP TABLE IF EXISTS Student;
DROP TABLE IF EXISTS Author;
DROP TABLE IF EXISTS Branch;

-- ================================
-- CREATE TABLES
-- ================================

CREATE TABLE Branch (
    branchid TEXT PRIMARY KEY,
    branchname TEXT,
    hod TEXT
);

CREATE TABLE Student (
    usn TEXT PRIMARY KEY,
    name TEXT,
    address TEXT,
    branchid TEXT,
    sem INTEGER,
    FOREIGN KEY (branchid) REFERENCES Branch(branchid)
);

CREATE TABLE Author (
    authorid TEXT PRIMARY KEY,
    authorname TEXT,
    country TEXT,
    age INTEGER
);

CREATE TABLE Book (
    bookid TEXT PRIMARY KEY,
    bookname TEXT,
    authorid TEXT,
    publisher TEXT,
    branchid TEXT,
    FOREIGN KEY (authorid) REFERENCES Author(authorid),
    FOREIGN KEY (branchid) REFERENCES Branch(branchid)
);

CREATE TABLE Borrow (
    usn TEXT,
    bookid TEXT,
    borrowed_date DATE,
    FOREIGN KEY (usn) REFERENCES Student(usn),
    FOREIGN KEY (bookid) REFERENCES Book(bookid)
);

-- ================================
-- INSERT DATA
-- ================================

INSERT INTO Branch VALUES
('MCA01','Computer Science','Dr. Ajay'),
('MCO02','Commerce','Dr. Santhosh'),
('MSC03','Science','Dr. Arti'),
('MBA04','Management','Dr. Narayana');

INSERT INTO Student VALUES
('CS001','Karthik','Bengaluru','MCA01',2),
('CS002','Keerti','Bengaluru','MCA01',2),
('CS003','Namita','Kolar','MCA01',2),
('CS004','Meenakshi','Chikaballapur','MCA01',2),
('CM001','Nisha','Bengaluru','MCO02',2),
('CM002','Arti','Bengaluru','MCO02',2);

INSERT INTO Author VALUES
('A001','Balaguruswamy','India',66),
('A002','Elmasri','UK',67),
('A003','Tanenbaum','USA',68);

INSERT INTO Book VALUES
('B001','Introduction to C','A001','Pearson','MCA01'),
('B002','DBMS','A002','Pearson','MCA01'),
('B003','Computer Networks','A003','Pearson','MCA01');

INSERT INTO Borrow VALUES
('CS001','B001','2022-07-15'),
('CS002','B002','2022-07-18'),
('CS002','B003','2022-07-21'),
('CS004','B001','2022-08-01'),
('CS004','B002','2022-08-05'),
('CS004','B003','2022-08-10');

-- ================================
-- QUERIES
-- ================================

-- 2(a) Students studying in 2nd sem MCA
SELECT * FROM Student
WHERE sem = 2 AND branchid = 'MCA01';

-- 2(b) Students who have NOT borrowed any books
SELECT * FROM Student
WHERE usn NOT IN (SELECT usn FROM Borrow);

-- 3(a) Details of 2nd sem MCA students who borrowed books
SELECT
    s.usn,
    s.name AS student_name,
    br.branchname,
    b.bookname,
    a.authorname,
    bo.borrowed_date
FROM Student s
JOIN Borrow bo ON s.usn = bo.usn
JOIN Book b ON bo.bookid = b.bookid
JOIN Author a ON b.authorid = a.authorid
JOIN Branch br ON s.branchid = br.branchid
WHERE s.sem = 2 AND s.branchid = 'MCA01';

-- 3(b) Number of books written by each author
SELECT
    a.authorname,
    COUNT(b.bookid) AS total_books
FROM Author a
JOIN Book b ON a.authorid = b.authorid
GROUP BY a.authorname;

-- 4(a) Students who borrowed more than 2 books
SELECT
    s.usn,
    s.name,
    s.address,
    s.branchid,
    s.sem,
    COUNT(bo.bookid) AS total_books
FROM Student s
JOIN Borrow bo ON s.usn = bo.usn
GROUP BY s.usn, s.name, s.address, s.branchid, s.sem
HAVING COUNT(bo.bookid) > 2;

-- 4(b) Students who borrowed books of more than one author
SELECT
    s.usn,
    s.name,
    s.address,
    s.branchid,
    s.sem,
    COUNT(DISTINCT b.authorid) AS author_count
FROM Student s
JOIN Borrow bo ON s.usn = bo.usn
JOIN Book b ON bo.bookid = b.bookid
GROUP BY s.usn, s.name, s.address, s.branchid, s.sem
HAVING COUNT(DISTINCT b.authorid) > 1;
