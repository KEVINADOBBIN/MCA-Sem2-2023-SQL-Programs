-- ====== VIEW CURRENT DATABASE ======
SELECT name FROM v$database;

-- EMPLOYEE TABLE
CREATE TABLE Employee (
    fname      VARCHAR2(15),
    minit      CHAR(1),
    lname      VARCHAR2(15),
    ssn        CHAR(5) PRIMARY KEY,
    bdate      DATE,
    address    VARCHAR2(50),
    gender     CHAR(1),
    salary     NUMBER(12,2),
    super_ssn  CHAR(5),
    dno        CHAR(5)
);

-- DEPARTMENT TABLE
CREATE TABLE Department (
    dname        VARCHAR2(20),
    dnumber      CHAR(5) PRIMARY KEY,
    mgssn        CHAR(5),
    mgrstartdate DATE,
    FOREIGN KEY (mgssn) REFERENCES Employee(ssn)
);

-- DEPT_LOCATIONS TABLE
CREATE TABLE Dept_Locations (
    dnumber   CHAR(5),
    dlocation VARCHAR2(50),
    FOREIGN KEY (dnumber) REFERENCES Department(dnumber)
);

-- PROJECT TABLE
CREATE TABLE Project (
    pnum      CHAR(5) PRIMARY KEY,
    pname     VARCHAR2(20),
    plocation VARCHAR2(20),
    dnum      CHAR(5),
    FOREIGN KEY (dnum) REFERENCES Department(dnumber)
);

-- WORKS_ON TABLE
CREATE TABLE Works_On (
    essn  CHAR(5),
    pno   CHAR(5),
    hours NUMBER(3),
    PRIMARY KEY (essn, pno),
    FOREIGN KEY (essn) REFERENCES Employee(ssn),
    FOREIGN KEY (pno) REFERENCES Project(pnum)
);

-- DEPENDENT TABLE
CREATE TABLE Dependent (
    essn           CHAR(5),
    dependent_name VARCHAR2(25),
    sex            CHAR(1),
    bdate          DATE,
    relationship   VARCHAR2(20),
    PRIMARY KEY (essn, dependent_name),
    FOREIGN KEY (essn) REFERENCES Employee(ssn)
);

-- EMPLOYEE
INSERT INTO Employee VALUES
('Dave','P','Christo','123',DATE '1995-02-06','Washington','M',6050,'128','10');

INSERT INTO Employee VALUES
('Jane','N','Dias','145',DATE '1992-01-14','Ohio','F',6800,'128','10');

INSERT INTO Employee VALUES
('Chris','M','Lobo','128',DATE '1975-01-12','Washington','M',10500,'175','10');

INSERT INTO Employee VALUES
('David','T','Smith','143',DATE '1982-12-10','NYC','M',5500,'148','20');

INSERT INTO Employee VALUES
('Anne','J','Thomas','148',DATE '1972-07-28','New Jersey','F',8500,'175','20');

INSERT INTO Employee VALUES
('John','K','Smith','175',DATE '1972-01-18','Washington','M',18900,NULL,'5');

INSERT INTO Employee VALUES
('Clara','M','Dsouza','167',DATE '1989-06-20','Atlanta','F',8250,'190','30');

INSERT INTO Employee VALUES
('Jim','B','Mathew','190',DATE '1973-08-10','Atlanta','M',11000,'175','30');

INSERT INTO Employee VALUES
('Nancy','S','Drew','155',DATE '1980-08-15','NYC','F',9500,'149','40');

INSERT INTO Employee VALUES
('Elizabeth','K','Smith','149',DATE '1975-01-18','NYC','F',12200,'175','40');

-- DEPARTMENT
INSERT INTO Department VALUES
('Production','10','128',DATE '2000-01-01');

INSERT INTO Department VALUES
('Marketing','20','148',DATE '2010-07-01');

INSERT INTO Department VALUES
('CEO Office','5','175',DATE '2016-01-01');

INSERT INTO Department VALUES
('Research','30','190',DATE '2017-01-01');

INSERT INTO Department VALUES
('Accounts','40','167',DATE '2021-12-01');

-- DEPT_LOCATIONS
INSERT INTO Dept_Locations VALUES ('10','Washington');
INSERT INTO Dept_Locations VALUES ('10','Ohio');
INSERT INTO Dept_Locations VALUES ('10','NYC');
INSERT INTO Dept_Locations VALUES ('20','NYC');
INSERT INTO Dept_Locations VALUES ('5','Washington');
INSERT INTO Dept_Locations VALUES ('30','Washington');
INSERT INTO Dept_Locations VALUES ('30','Atlanta');
INSERT INTO Dept_Locations VALUES ('40','NYC');

-- PROJECT
INSERT INTO Project VALUES ('1','ProductX','NYC','10');
INSERT INTO Project VALUES ('2','ProductY','Ohio','10');
INSERT INTO Project VALUES ('10','Marketing Strategy','Washington','20');
INSERT INTO Project VALUES ('20','Product Recycle','Atlanta','30');

-- WORKS_ON
INSERT INTO Works_On VALUES ('123','1',36);
INSERT INTO Works_On VALUES ('123','20',4);
INSERT INTO Works_On VALUES ('145','1',40);
INSERT INTO Works_On VALUES ('128','1',24);
INSERT INTO Works_On VALUES ('128','2',16);
INSERT INTO Works_On VALUES ('143','10',28);
INSERT INTO Works_On VALUES ('143','20',12);
INSERT INTO Works_On VALUES ('190','1',8);
INSERT INTO Works_On VALUES ('190','2',8);
INSERT INTO Works_On VALUES ('190','20',24);

-- DEPENDENT
INSERT INTO Dependent VALUES
('128','Alice','F',DATE '2002-10-10','Daughter');

INSERT INTO Dependent VALUES
('128','Joy','M',DATE '2007-05-27','Son');

INSERT INTO Dependent VALUES
('148','Ben','M',DATE '2000-07-15','Son');

INSERT INTO Dependent VALUES
('175','Susan','F',DATE '1999-02-10','Daughter');

INSERT INTO Dependent VALUES
('175','Nancy','F',DATE '2005-03-14','Daughter');

INSERT INTO Dependent VALUES
('190','Mary','F',DATE '1945-04-18','Mother');

COMMIT;

SELECT * FROM Employee;
SELECT * FROM Department;
SELECT * FROM Dept_Locations;
SELECT * FROM Project;
SELECT * FROM Works_On;
SELECT * FROM Dependent;
