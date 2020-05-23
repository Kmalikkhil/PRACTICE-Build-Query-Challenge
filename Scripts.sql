/*
Kanishka Malikkhil
St_ID: 103220762
*/

/*
---- TASK 1 ----

Subject(SubjCode, Decsciption)
PRIMARY KEY (SubjCode)

Student(StudentID, Surname,GivenName,Gender)
PRIMARY KEY(StudentID)

SubjectOffering(SubjCode,Year,Semester,Fee, StaffID)
PRIMARY KEY (SubjCode,Year,Semester)
FOREIGN KEY (SubjCode) REFERENCES Subject	
FOREIGN KEY (StaffID) REFERENCES Teacher

Enrolment (StudentID,SubjCode,Year,Semester,Grade,DateEnrolled)
PRIMARY KEY (StudentID,SubjCode,Year,Semester)
FOREIGN KEY (StudentID) REFERENCES Student
FOREIGN KEY (SubjCode) REFERENCES SubjectOffering
FOREIGN KEY (Year) REFERENCES SubjectOffering
FOREIGN KEY (Semester) REFERENCES SubjectOffering

Teacher (StaffID,Surnmae,GivenName)
PRIMARY KEY (StaffID)

*/

--- Task 2 ---

CREATE TABLE Subject(
SubjCode NVARCHAR(100), 
Description NVARCHAR(500),
PRIMARY KEY (SubjCode));

CREATE TABLE Student(
StudentID NVARCHAR(10), 
Surname NVARCHAR(100) NOT NULL,
GivenName NVARCHAR(100) NOT NULL,
Gender NVARCHAR(1)
CHECK (Gender IN ('M','F','I'))
PRIMARY KEY(StudentID));

CREATE TABLE Teacher (
StaffID INT Check (StaffID between 0 and 99999999),
Surname NVARCHAR(100) NOT NULL,
GivenName NVARCHAR(100) NOT NULL
PRIMARY KEY (StaffID));

CREATE TABLE SubjectOffering(
SubjCode NVARCHAR(100),
Year INT Check (Year between 0 and 9999),
Semester INT CHECK (Semester IN(1,2)),
Fee Money NOT NULL CHECK (Fee > 0), 
StaffID INT Check (StaffID between 0 and 99999999),
PRIMARY KEY (SubjCode,Year,Semester),
FOREIGN KEY (SubjCode) REFERENCES Subject,	
FOREIGN KEY (StaffID) REFERENCES Teacher);

CREATE TABLE Enrolment (
StudentID NVARCHAR(10),
SubjCode NVARCHAR(100),
Year INT Check (Year between 0 and 9999),
Semester INT CHECK (Semester IN(1,2)),
Grade NVARCHAR(2) CHECK (Grade IN ('N', 'P', 'C', 'D', 'HD')) DEFAULT 'NULL',
DateEnrolled DATE,
PRIMARY KEY (StudentID,SubjCode,Year,Semester),
FOREIGN KEY (StudentID) REFERENCES Student,
FOREIGN KEY (SubjCode, Year, Semester) REFERENCES SubjectOffering);


--- Task 3 ---

INSERT INTO Subject (SubjCode, Description) VALUES
    ('ICTWEB425','Apply SQL to extract & manipulate data'),
    ('ICTDBS403','Create Basic Databases'),
    ('ICTDBS502','Design a Database');

INSERT INTO Student (StudentId, Surname, GivenName, Gender) VALUES
    ('s12233445','Morrison','Scott','M'),
    ('s23344556','Gillard','Julia','F'),
    ('s34455667','Whitlam','Gough','M'),
    ('103220762','Malikkhil','Kanishka','M');

INSERT INTO Teacher (StaffID, Surname, GivenName) VALUES
    (98776655,'Starr','Ringo'),
    (87665544,'Lennon','John'),
    (76554433,'McCartney','Paul');

INSERT INTO SubjectOffering (SubjCode, Year, Semester, Fee, StaffID) VALUES
    ('ICTWEB425',2018,1,200,98776655),
    ('ICTWEB425',2019,1,225,98776655),
    ('ICTDBS403',2019,1,200,87665544),
    ('ICTDBS403',2019,2,200,76554433),
    ('ICTDBS502',2018,2,225,87665544);

INSERT INTO Enrolment (StudentID, SubjCode, Year, Semester, Grade) VALUES
    ('s12233445','ICTWEB425',2018,1,'D'),
    ('s23344556','ICTWEB425',2018,1,'P'),
    ('s12233445','ICTWEB425',2019,1,'C'),
    ('s23344556','ICTWEB425',2019,1,'HD'),
    ('s34455667','ICTWEB425',2019,1,'P'),
    ('s12233445','ICTDBS403',2019,1,'C'),
    ('s23344556','ICTDBS403',2019,2,NULL),
    ('s34455667','ICTDBS403',2019,2,NULL),
    ('s23344556','ICTDBS502',2018,2,'P'),
    ('s34455667','ICTDBS502',2018,2,'N'),
    ('103220762','ICTDBS403',2019,1,'HD');