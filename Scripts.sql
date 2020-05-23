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