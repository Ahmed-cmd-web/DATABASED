-- CREATE DATABASE Advising_Team_119;

USE Advising_Team_119;
GO

CREATE OR ALTER PROCEDURE CreateAllTables
AS
CREATE TABLE Advisor
(
    advisor_id INT IDENTITY(1,1) PRIMARY KEY,
    name VARCHAR(40) NOT NULL,
    email VARCHAR(40) NOT NULL ,
    office VARCHAR(40) NOT NULL ,
    password VARCHAR(40) NOT NULL
)

CREATE TABLE Student
(
    student_id INT IDENTITY(1,1) PRIMARY KEY,
    f_name VARCHAR(40) ,
    l_name VARCHAR(40) ,
    gpa DECIMAL(2,2) CHECK (gpa<=5.0 AND gpa>=0.7),
    faculty VARCHAR(40) ,
    email VARCHAR(40)  ,
    major VARCHAR(40) ,
    password VARCHAR(40) ,
    semester INT ,
    acquired_hours INT ,
    assigned_hours INT ,
    advisor_id INT ,
    CONSTRAINT advisor_FK FOREIGN KEY (advisor_id) REFERENCES Advisor
            ON UPDATE CASCADE,
)


CREATE TABLE Course
(
    course_id INT PRIMARY KEY,
    name VARCHAR(40) NOT NULL,
    major VARCHAR(40) NOT NULL,
    semester INT NOT NULL,
    credit_hours INT NOT NULL,
    offered BIT NOT NULL,
);
CREATE TABLE Student_Phone
(
    student_id INT NOT NULL,
    phone_number VARCHAR(40) NOT NULL,
    CONSTRAINT student_phone_pk_constraint PRIMARY KEY(student_id,phone_number),
    CONSTRAINT student_id_FK FOREIGN KEY (student_id) REFERENCES Student
            ON UPDATE CASCADE
            ON DELETE CASCADE,
)

CREATE TABLE PreqCourse_course
(
    prerequisite_course_id INT NOT NULL,
    course_id INT NOT NULL,
    CONSTRAINT prerequisite_course_id_course_id_pk_constraint PRIMARY KEY(prerequisite_course_id,course_id),
    CONSTRAINT prerequisite_course_id_FK FOREIGN KEY (prerequisite_course_id) REFERENCES Course,
    CONSTRAINT course_id_FK FOREIGN KEY (course_id) REFERENCES Course

);
CREATE TABLE Instructor
(
    instructor_id INT PRIMARY KEY,
    name VARCHAR(40) NOT NULL,
    faculty VARCHAR(40) NOT NULL,
    email VARCHAR(40) NOT NULL ,
    office VARCHAR(40) NOT NULL,
);

CREATE TABLE Instructor_Course
(
    course_id INT NOT NULL,
    instructor_id INT NOT NULL,
    CONSTRAINT instructor_id_course_id_pk_constraint PRIMARY KEY(instructor_id,course_id),
    CONSTRAINT course_id_FK_Instructor_Course FOREIGN KEY (course_id) REFERENCES Course
                ON UPDATE CASCADE,
    CONSTRAINT instructor_id_FK_Instructor_Course FOREIGN KEY (instructor_id) REFERENCES Instructor
                ON UPDATE CASCADE
                ON DELETE CASCADE,
);

CREATE TABLE Student_Instructor_Course_Take
(
    course_id INT NOT NULL,
    instructor_id INT NOT NULL,
    student_id INT NOT NULL,
    semester_code VARCHAR(40) ,
    exam_type VARCHAR(40) default 'Normal' CHECK (exam_type in ('Normal','First_makeup','Second_makeup')),
    grade DECIMAL(5,2) DEFAULT NULL,
    CONSTRAINT course_id_instructor_id_student_id PRIMARY KEY(instructor_id,course_id,student_id),
    CONSTRAINT course_id_FK_Student_Instructor_Course_Take FOREIGN KEY (course_id) REFERENCES Course,
    CONSTRAINT instructor_id_FK_Student_Instructor_Course_Take FOREIGN KEY (instructor_id) REFERENCES Instructor,
    CONSTRAINT student_id_FK_Student_Instructor_Course_Take FOREIGN KEY (student_id) REFERENCES Student
)

CREATE TABLE Semester
(
    semester_code INT PRIMARY KEY,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
);

CREATE TABLE Course_Semester
(
    course_id INT,
    semester_code INT,
    FOREIGN Key(course_id) REFERENCES Course (course_id) ON UPDATE CASCADE,
    FOREIGN Key(semester_code) REFERENCES Semester (semester_code) ON UPDATE CASCADE,
    FOREIGN Key(course_id) REFERENCES Course (course_id) ON DELETE CASCADE,
    FOREIGN Key(semester_code) REFERENCES Semester (semester_code) ON DELETE CASCADE,
    CONSTRAINT course_id_semester_code PRIMARY KEY(course_id,semester_code),
);


CREATE TABLE Slot
(
    slot_id INT PRIMARY KEY,
    day VARCHAR(40) NOT NULL,
    time time NOT NULL,
    location VARCHAR(40) NOT NULL ,
    course_id INT NOT NULL,
    instructor_id INT NOT NULL,
    CONSTRAINT course_FK_Slot FOREIGN KEY(course_id) REFERENCES Course
            ON UPDATE CASCADE,
    CONSTRAINT instructor_FK_Slot FOREIGN KEY(instructor_id) REFERENCES Instructor
            ON UPDATE CASCADE,
);


CREATE TABLE Graduation_plan
(
    plan_id INT NOT NULL,
    semester_code INT NOT NULL,
    major VARCHAR(40) NOT NULL,
    expected_grad_semester INT NOT NULL,
    semester_credit_hours INT NOT NULL,
    course_name VARCHAR(40) NOT NULL ,
    offered BIT NOT NULL,
    advisor_id INT NOT NULL,
    student_id INT NOT NULL,
    CONSTRAINT PK_Content PRIMARY KEY (plan_id, semester_code),
    FOREIGN Key(semester_code) REFERENCES Semester (semester_code) ON UPDATE CASCADE,
    CONSTRAINT advisor_FK_Graduation_plan FOREIGN KEY(advisor_id) REFERENCES Advisor,
    CONSTRAINT student_FK_Graduation_plan FOREIGN KEY(student_id) REFERENCES Student,
);


CREATE TABLE GradPlan_Course
(
    plan_id INT NOT NULL ,
    semester_code INT NOT NULL,
    student_id INT NOT NULL,
    CONSTRAINT plan_id_course_code_student_id PRIMARY KEY(plan_id,semester_code,student_id),
    CONSTRAINT student_id_FK_GradPlan_Course FOREIGN KEY (student_id) REFERENCES Student
                ON UPDATE CASCADE
                ON DELETE CASCADE,
    CONSTRAINT grad_plan_FK_GradPlan_Course FOREIGN KEY (plan_id,semester_code) REFERENCES Graduation_plan
                ON UPDATE CASCADE
                ON DELETE CASCADE,
);

CREATE TABLE Request
(
    request_id INT PRIMARY KEY NOT NULL ,
    comment VARCHAR(255) ,
    status VARCHAR(40) DEFAULT 'pending' CHECK (status IN ('pending','accepted','rejected')),
    --  ‘pending’(default), ‘accepted’ or ‘rejected’.
    credit_hours INT,
    advisor_id INT NOT NULL,
    student_id INT NOT NULL,
    course_id INT NOT NULL,
    CONSTRAINT advisor_FK_Request FOREIGN KEY(advisor_id) REFERENCES Advisor,
    CONSTRAINT student_FK_Request FOREIGN KEY(student_id) REFERENCES Student,
    CONSTRAINT course_FK_Request FOREIGN KEY(course_id) REFERENCES Course,
);

CREATE TABLE MakeUp_Exam
(
    exam_id INT PRIMARY KEY NOT NULL,
    date DATE NOT NULL,
    type VARCHAR(40),
    course_id INT NOT NULL,
    CONSTRAINT course_FK_MakeUp_Exam FOREIGN KEY(course_id) REFERENCES Course,
)

CREATE TABLE Exam_Student
(
    student_id INT NOT NULL,
    exam_id INT NOT NULL,
    course_id INT NOT NULL,
    CONSTRAINT student_id_course_id_exam_id PRIMARY KEY(student_id,exam_id,course_id),
    CONSTRAINT exam_FK_Exam_Student FOREIGN KEY(exam_id) REFERENCES MakeUp_Exam
                ON UPDATE CASCADE,
    CONSTRAINT student_FK_Exam_Student FOREIGN KEY(student_id) REFERENCES Student
                ON UPDATE CASCADE,
    CONSTRAINT course_FK_Exam_Student FOREIGN KEY(course_id) REFERENCES Course
                ON UPDATE CASCADE,
)

CREATE TABLE Payment
(
    payment_id INT PRIMARY KEY,
    amount DECIMAL(10,5) NOT  NULL,
    start_date DATE NOT NULL,
    deadline DATE NOT NULL,
    n_installments INT not NULL,
    status VARCHAR(40) DEFAULT 'notPaid' CHECK (status IN ('notPaid','Paid')),
    fund_percentage DECIMAL(3,2) CHECK ( fund_percentage<=100 AND fund_percentage>=0),
    student_id INT NOT NULL,
    semester_code INT NOT NULL,
    CONSTRAINT student_FK_Payment FOREIGN KEY(student_id) REFERENCES Student
                ON UPDATE CASCADE,
    CONSTRAINT semester_code_FK_Payment FOREIGN KEY(semester_code) REFERENCES Semester
                ON UPDATE CASCADE,
)


CREATE TABLE Installment
(
    payment_id INT NOT NULL,
    deadline DATE NOT NULL,
    amount DECIMAL(10,5) NOT  NULL,
    status BIT not NULL,
    start_date DATE NOT NULL,
    CONSTRAINT payment_id_deadline_PK PRIMARY KEY(payment_id,deadline),
    CONSTRAINT payment_id_FK_Installment FOREIGN KEY(payment_id) REFERENCES Payment
                ON UPDATE CASCADE,
)
    GO

CREATE OR ALTER PROCEDURE DROPALLKEYCONSTRAINTS
AS
DECLARE @command VARCHAR(255)
-- variable to store the command
DECLARE pointer CURSOR FAST_FORWARD READ_ONLY FOR -- declaring the row pointer
            SELECT CONCAT('ALTER TABLE ', TABLE_SCHEMA, '.[', TABLE_NAME, '] DROP CONSTRAINT [', CONSTRAINT_NAME, ']') AS Name
FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
WHERE CONSTRAINT_TYPE = 'FOREIGN KEY'
OPEN pointer
-- intializing the pointer

FETCH NEXT FROM pointer INTO @command
-- store teh row result in the command variable

WHILE @@FETCH_STATUS=0 -- while there are still results(rows)
            BEGIN
    EXEC(@command)
    -- exceute the command
    FETCH NEXT FROM pointer INTO @command
-- set the next result in teh command
END;
CLOSE pointer
-- closse the cursor
DEALLOCATE pointer -- remove it from memory
    GO

CREATE OR ALTER PROCEDURE DropAllTables
AS
EXEC DROPALLKEYCONSTRAINTS;
DROP TABLE
            Student,
            Advisor,
            Student_Phone,
            Course,
            PreqCourse_course,
            Instructor,
            Instructor_Course,
            Student_Instructor_Course_Take,
            Semester,
            Course_Semester,
            Slot,
            Graduation_plan,
            GradPlan_Course,
            Request,
            MakeUp_Exam,
            Exam_Student,
            Payment,
            Installment
    GO


CREATE OR ALTER PROCEDURE clearAllTables
AS
EXEC DropAllTables
EXEC CreateAllTables
    GO


-- All Other Requirements


CREATE OR ALTER PROCEDURE Procedures_StudentRegistration
    @first_name VARCHAR(40),
    @last_name VARCHAR(40),
    @password VARCHAR(40),
    @faculty VARCHAR(40),
    @email VARCHAR(40),
    @major VARCHAR(40),
    @Semester int,
    @id INT OUTPUT
AS
INSERT INTO Student
    (f_name,l_name,password,faculty,email,major,semester)
VALUES
    (@first_name, @last_name, @password, @faculty, @email, @major, @Semester)
SET @id=SCOPE_IDENTITY()
    GO

CREATE OR ALTER PROCEDURE Procedures_AdvisorRegistration
    @advisor_name VARCHAR(40),
    @password VARCHAR(40),
    @email VARCHAR(40),
    @office VARCHAR(40),
    @id INT OUTPUT
AS
INSERT INTO Advisor
    (name,password,email,office)
VALUES
    (@advisor_name, @password, @email, @office)
SET @id=SCOPE_IDENTITY()
    GO


CREATE OR ALTER PROCEDURE Procedures_AdminListStudents
AS
SELECT *
FROM Student
    GO


CREATE OR ALTER VIEW Advisors_Graduation_Plan
As
    Select g.plan_id, g.semester_code, g.major, g.expected_grad_semester, g.semester_credit_hours, g.course_name, g.offered, g.student_id, a.advisor_id, a.name AS Advisor_name

    FROM Graduation_plan g FULL OUTER JOIN Advisor a ON g.advisor_id = a.Advisor_id
    GO

CREATE OR ALTER PROCEDURE Procedures_AdminListAdvisors
AS
SELECT *
FROM Advisor
    GO

CREATE OR ALTER PROCEDURE AdminListStudentsWithAdvisors
AS
SELECT *
FROM Student s LEFT OUTER JOIN Advisor a ON s.advisor_id = a.Advisor_id
    GO


CREATE OR ALTER VIEW view_Students
AS
    SELECT *
    From Student
go

CREATE OR ALTER VIEW Students_Courses_transcript
AS

    SELECT x.student_id, s.f_name+' '+s.l_name as Student_Name, x.course_id, c.name AS Course_NAME, s.semester, x.exam_type, i.name AS INSTRUCTOR_NAME
    From Student_Instructor_Course_Take x
        inner JOIN Student s On (x.student_id= s.student_id)
        inner JOIN Instructor i on (x.instructor_id = i.instructor_id)
        inner JOIN Course c on (x.course_id= c.course_id)

go

CREATE OR ALTER VIEW Semster_offered_Courses
AS
    SELECT s.course_id, s.semester_code, c.name
    FROM Course_Semester s
        inner JOIN Course c on s.course_id = s.course_id
go





CREATE OR ALTER PROCEDURE AdminAddingSemester
    @start_date date,
    @end_date date,
    @semester_code VARCHAR(40)
As
INSERT INTO Semester
    (start_date,end_date,semester_code)
VALUES
    (@start_date, @end_date, @semester_code)

go



CREATE OR ALTER PROCEDURE Procedures_ViewRequiredCourses
    @StudentID INT,
    @Current_semester_code Varchar (40)
AS
SELECT c.*
FROM Course c
    JOIN Student_Instructor_Course_Take sict
    ON sict.course_id=c.course_id
WHERE sict.student_id=@StudentID AND sict.semester_code=@Current_semester_code
    GO


CREATE OR ALTER VIEW all_Pending_Requests

As
    Select r.*, s.f_name +' '+ s.l_name as Student_name, a.name as Advisor_name
    from Request r inner join Student s on (r.student_id = s.student_id)
                   inner join Advisor a on (a.advisor_id = r.advisor_id)
    where r.status='pending';
go



CREATE FUNCTION FN_StudentCheckSMEligiability(
    @CourseID INT,
    @StudentID INT
    )
    RETURNS BIT
        AS BEGIN
        DECLARE @grade DECIMAL;
        DECLARE @failed_courses_count INT;
        SET @grade=(SELECT grade FROM Student_Instructor_Course_Take
            WHERE course_id=@CourseID AND student_id=@StudentID AND exam_type='First_makeup')

        SET @failed_courses_count=(SELECT COUNT(*) FROM Student_Instructor_Course_Take
                                        WHERE student_id=@StudentID AND grade<50)

        RETURN IIF((@grade=NULL OR @grade<50) AND @failed_courses_count<=2,1,0)
    END
    GO





-- Insert statements for Student table
INSERT INTO Student ( f_name, l_name, gpa, faculty, email, major, password, semester, acquired_hours, assigned_hours, advisor_id)
VALUES ( 'John', 'Doe', 3.8, 'Engineering', 'john.doe@example.com', 'Computer Science', 'password123', 'Paid', 'Fall 2023',  12, 101);

-- Insert statements for Student_Phone table
INSERT INTO Student_Phone (student_id, phone_number)
VALUES (1, '123-456-7890');

-- Insert statements for Course table
INSERT INTO Course (course_id, name, major, offered,course_name, credit_hours, semester)
VALUES (101, 'Database Management', 'Computer Science', 1,'ksns', 3, 3);

-- Insert statements for PreqCourse_course table
INSERT INTO PreqCourse_course (prerequisite_course_id, course_id)
VALUES (101, 101);

-- Insert statements for Instructor table
INSERT INTO Instructor (instructor_id, name, email, faculty, office)
VALUES (1001, 'Jane Smith', 'jane.smith@example.com', 'Engineering', 'Building A, Room 101');

-- Insert statements for Instructor_Course table
INSERT INTO Instructor_Course (course_id, instructor_id)
VALUES (101, 1001);


-- Insert statements for Student_Instructor_Course_Take table
INSERT INTO Student_Instructor_Course_Take (student_id, instructor_id, course_id, grade, exam_type)
VALUES (3, 1001, 101, 8.00, 'First_makeup');

-- Insert statements for Semester table
-- INSERT INTO Semester (semester_code, start_date, end_date)
-- VALUES (1, '2023-09-01', '2023-12-15');

-- Insert statements for Course_Semester table
INSERT INTO Course_Semester (course_id, semester_code)
VALUES (101, 1);

-- Insert statements for Advisor table
INSERT INTO Advisor ( name, email, office, password)
VALUES ( 'Mark Johnson', 'mark.johnson@example.com', 'Building B, Room 202', 'password456');

-- Insert statements for Slot table
INSERT INTO Slot (slot_id, day, time, location, course_id, instructor_id)
VALUES (1, 'Monday', '10:00', 'Building A, Room 201', 101, 1001);

-- Insert statements for Graduation_Plan table
INSERT INTO Graduation_Plan (plan_id, semester_code, semester_credit_hours, expected_grad_semester, advisor_id, student_id,major,course_name,offered)
VALUES (2, 1, 15, 12, 1, 3,'skldnc','kscjd',1);

-- Insert statements for GradPlan_Course table
INSERT INTO GradPlan_Course (plan_id, semester_code, student_id)
VALUES (2, 1, 3);
