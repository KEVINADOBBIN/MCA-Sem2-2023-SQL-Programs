CREATE TABLE Employee (
    fname TEXT,
    minit CHAR(1),
    lname TEXT,
    ssn CHAR(5) PRIMARY KEY,
    bdate DATE,
    address TEXT,
    gender CHAR(1),
    salary REAL,
    super_ssn CHAR(5),
    dno CHAR(5)
);

CREATE TABLE Department (
    dname TEXT,
    dnumber CHAR(5) PRIMARY KEY,
    mgrssn CHAR(5),
    mgrstartdate DATE,
    FOREIGN KEY (mgrssn) REFERENCES Employee(ssn)
);

CREATE TABLE Dept_Locations (
    dnumber CHAR(5),
    dlocation TEXT,
    FOREIGN KEY (dnumber) REFERENCES Department(dnumber)
);

CREATE TABLE Project (
    pnum CHAR(5) PRIMARY KEY,
    pname TEXT,
    plocation TEXT,
    dnum CHAR(5),
    FOREIGN KEY (dnum) REFERENCES Department(dnumber)
);

CREATE TABLE Works_On (
    essn CHAR(5),
    pno CHAR(5),
    hours INTEGER,
    PRIMARY KEY (essn, pno),
    FOREIGN KEY (essn) REFERENCES Employee(ssn),
    FOREIGN KEY (pno) REFERENCES Project(pnum)
);

CREATE TABLE Dependent (
    essn CHAR(5),
    dependent_name TEXT,
    sex CHAR(1),
    bdate DATE,
    relationship TEXT,
    PRIMARY KEY (essn, dependent_name),
    FOREIGN KEY (essn) REFERENCES Employee(ssn)
);

INSERT INTO Employee VALUES
('Dave','P','Christo','123','1995-02-06','Washington','M',6050,'128','10'),
('Jane','N','Dias','145','1992-01-14','Ohio','F',6800,'128','10'),
('Chris','M','Lobo','128','1975-01-12','Washington','M',10500,'175','10'),
('David','T','Smith','143','1982-12-10','NYC','M',5500,'148','20'),
('Anne','J','Thomas','148','1972-07-28','New Jersey','F',8500,'175','20'),
('John','K','Smith','175','1972-01-18','Washington','M',18900,NULL,'5'),
('Clara','M','Dsouza','167','1989-06-20','Atlanta','F',8250,'190','30'),
('Jim','B','Mathew','190','1973-08-10','Atlanta','M',11000,'175','30'),
('Nancy','S','Drew','155','1980-08-15','NYC','F',9500,'149','40'),
('Elizabeth','K','Smith','149','1975-01-18','NYC','F',12200,'175','40');

INSERT INTO Department VALUES
('Production','10','128','2000-01-01'),
('Marketing','20','148','2010-07-01'),
('CEO Office','5','175','2016-01-01'),
('Research','30','190','2017-01-01'),
('Accounts','40','167','2021-12-01');

INSERT INTO Dept_Locations VALUES
('10','Washington'),
('10','Ohio'),
('10','NYC'),
('20','NYC'),
('5','Washington'),
('30','Washington'),
('30','Atlanta'),
('40','NYC');

INSERT INTO Project VALUES
('1','ProductX','NYC','10'),
('2','ProductY','Ohio','10'),
('10','Marketing Strategy','Washington','20'),
('20','Product Recycle','Atlanta','30');

INSERT INTO Works_On VALUES
('123','1',36),
('123','20',4),
('145','1',40),
('128','1',24),
('128','2',16),
('143','10',28),
('143','20',12),
('190','1',8),
('190','2',8),
('190','20',24);

INSERT INTO Dependent VALUES
('128','Alice','F','2002-10-10','Daughter'),
('128','Joy','M','2007-05-27','Son'),
('148','Ben','M','2000-07-15','Son'),
('175','Susan','F','1999-02-10','Daughter'),
('175','Nancy','F','2005-03-14','Daughter'),
('190','Mary','F','1945-04-18','Mother');

SELECT * FROM Employee;
SELECT * FROM Department;
SELECT * FROM Dept_Locations;
SELECT * FROM Project;
SELECT * FROM Works_On;
SELECT * FROM Dependent;