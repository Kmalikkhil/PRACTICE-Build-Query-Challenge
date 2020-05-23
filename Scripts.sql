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
Decsciption NVARCHAR(500)
PRIMARY KEY (SubjCode));

CREATE TABLE Student(
StudentID NVARCHAR(10), 
Surname NVARCHAR(100) NOT NULL,
GivenName NVARCHAR(100) NOT NULL,
Gender NVARCHAR(1)
CHECK (Gender IN ('M','F','I'))
PRIMARY KEY(StudentID));

CREATE TABLE Teacher (
StaffID INT CHECK (DATALENGTH(StaffID) = 8),
Surname NVARCHAR(100) NOT NULL,
GivenName NVARCHAR(100) NOT NULL
PRIMARY KEY (StaffID));

CREATE TABLE SubjectOffering(
SubjCode NVARCHAR(100),
Year INT CHECK (DATALENGTH(Year) = 4),
Semester INT CHECK (Semester IN(1,2)),
Fee Money NOT NULL CHECK (Fee > 0), 
StaffID INT
PRIMARY KEY (SubjCode,Year,Semester),
FOREIGN KEY (SubjCode) REFERENCES Subject,	
FOREIGN KEY (StaffID) REFERENCES Teacher);

CREATE TABLE Enrolment (
StudentID NVARCHAR(10),
SubjCode NVARCHAR(100),
Year INT CHECK (DATALENGTH(Year) = 4),
Semester INT CHECK (Semester IN(1,2)),
Grade NVARCHAR(2) CHECK (Grade IN ('N', 'P', 'C', 'D', 'HD')) DEFAULT 'NULL',
DateEnrolled DATE,
PRIMARY KEY (StudentID,SubjCode,Year,Semester),
FOREIGN KEY (StudentID) REFERENCES Student,
FOREIGN KEY (SubjCode, Year, Semester) REFERENCES SubjectOffering);


