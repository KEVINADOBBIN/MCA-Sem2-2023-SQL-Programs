-- =====================================================
-- DBMS LAB
-- PROGRAM 03
-- MCA Department, St. Francis College
-- SQLite Compatible
-- =====================================================

PRAGMA foreign_keys = ON;

-- =========================
-- DROP TABLES (IF EXIST)
-- =========================
DROP TABLE IF EXISTS Borrow;
DROP TABLE IF EXISTS Book;
DROP TABLE IF EXISTS Student;
DROP TABLE IF EXISTS Author;
DROP TABLE IF EXISTS Branch;

-- =========================
-- CREATE TABLES
-- =========================

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

-- =========================
-- INSERT DATA
-- =========================

-- Branch
INSERT INTO Branch VALUES
('MCA01','Computer Science','Dr. Ajay'),
('MCO02','Commerce','Dr. Santhosh'),
('MSC03','Science','Dr. Arti'),
('MBA04','Management','Dr. Narayana'),
('MAA05','Arts','Dr. Radhika');

-- Student
INSERT INTO Student VALUES
('CS001','Karthik','Bengaluru','MCA01',2),
('CM001','Nisha','Bengaluru','MCO02',2),
('CS002','Keerti','Bengaluru','MCA01',2),
('CS003','Namita','Kolar','MCA01',2),
('CS004','Meenakshi','Chikaballapur','MCA01',2),
('CM002','Arti','Bengaluru','MCO02',2),
('SC001','Radha','Bengaluru','MSC03',2),
('SC002','Reena','Bengaluru','MSC03',2),
('CM003','Akash','Bengaluru','MCO02',2),
('MG001','Vidya','Bengaluru','MBA04',3),
('MG002','Divya','Bengaluru','MBA04',3);

-- Author
INSERT INTO Author VALUES
('A0001','Forouzan','USA',62),
('A0002','Morgan','UK',58),
('A0003','Somashekar','India',48),
('A0004','Sreekanth','India',46),
('A0005','Hans','UK',56),
('A0006','Agarwal','India',46),
('A0007','Michael','USA',52),
('A0008','Stallings','USA',61),
('A0009','Lakshminarayan','India',57),
('A0010','Kernigham','UK',65),
('A0011','Balaguruswamy','India',66),
('A0012','Elmasri','UK',67),
('A0013','Tanenbaum','USA',68);

-- Book
INSERT INTO Book VALUES
('CS1','Introduction to C Programming','A0011','Pearson','MCA01'),
('CS2','Fundamentals of DBMS','A0012','EEE','MCA01'),
('CS3','Computer Networks','A0013','Pearson','MCA01'),
('CS4','Data Structures','A0001','Pearson','MCA01'),
('CS5','Complete Java Reference','A0003','Pearson','MCA01'),
('CM1','Financial Accounting','A0006','BPB','MCO02'),
('CM2','Accounting and Auditing','A0006','BPB','MCO02'),
('CM3','Cost Accounting','A0009','Saraswati','MCO02'),
('MG1','Business Management','A0004','Saraswati','MBA04'),
('MG2','Human Resource Management','A0004','Saraswati','MBA04'),
('MG3','Marketing Management','A0007','Tata McGraw Hill','MBA04'),
('MG4','Financial Management','A0007','Tata McGraw Hill','MBA04');

-- Borrow
INSERT INTO Borrow VALUES
('CS001','CS1','2022-07-15'),
('CM001','CM1','2022-07-18'),
('CS002','CS4','2022-07-22'),
('CS003','CS3','2022-07-22'),
('CS004','CS1','2022-08-01'),
('CM002','CM2','2022-08-01'),
('CS002','CS1','2022-07-21'),
('CS003','CS2','2022-07-05'),
('CS004','CS3','2022-08-03'),
('CM003','CM1','2022-08-03'),
('CS004','CS3','2022-08-08'),
('CS002','CS3','2022-08-21');

-- =========================
-- DISPLAY TABLE DATA
-- =========================
SELECT * FROM Branch;
SELECT * FROM Student;
SELECT * FROM Author;
SELECT * FROM Book;
SELECT * FROM Borrow;
