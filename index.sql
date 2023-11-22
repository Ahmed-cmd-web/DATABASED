-- Description : Milestone_2_Database_Project
-- Team : 119
-- Authors : Ahmed Said, Ahmed Mohammed, Mostafa Ahmed , Ahmed Hossam , Mohammed Youssef
-- Due_Date : 2023-12-1

CREATE DATABASE Advising_Team_119;

USE Advising_Team_119;
    GO

CREATE DATABASE Advising_Team_119;
    GO

CREATE OR ALTER PROCEDURE CreateAllTables
    AS
        CREATE TABLE Advisor (
            advisor_id INT PRIMARY KEY IDENTITY,
            name       VARCHAR(40) NOT NULL,
            email      VARCHAR(40) NOT NULL,
            office     VARCHAR(40) NOT NULL,
            password   VARCHAR(40) NOT NULL
        );

        CREATE TABLE Student (
            student_id       INT PRIMARY KEY IDENTITY,
            f_name           VARCHAR(40)  NOT NULL,
            l_name           VARCHAR(40)  NOT NULL,
            gpa              DECIMAL(3,2) CHECK (gpa<=5.0 AND gpa>=0.7),
            faculty          VARCHAR(40)  NOT NULL,
            email            VARCHAR(40)  NOT NULL,
            major            VARCHAR(40)  NOT NULL,
            password         VARCHAR(40)  NOT NULL,
            financial_status BIT          ,
            semester         INT          NOT NULL,
            acquired_hours   INT          ,
            assigned_hours   INT          ,
            advisor_id       INT          ,
            CONSTRAINT advisor_FK_Student FOREIGN KEY (advisor_id) REFERENCES Advisor ON UPDATE CASCADE ON DELETE CASCADE
        );

        CREATE TABLE Course (
                course_id    INT PRIMARY KEY IDENTITY,
                name         VARCHAR(40) NOT NULL,
                major        VARCHAR(40) NOT NULL,
                is_offered   BIT         NOT NULL,
                credit_hours INT         NOT NULL,
                semester     INT         NOT NULL,
        );

        CREATE TABLE Student_Phone (
            student_id   INT         NOT NULL,
            phone_number VARCHAR(40) NOT NULL,
            CONSTRAINT student_id_phone_number_PK_Student_Phone PRIMARY KEY (student_id,phone_number),
            CONSTRAINT student_id_FK_Student_Phone              FOREIGN KEY (student_id) REFERENCES Student (student_id) ON UPDATE CASCADE ON DELETE CASCADE,
        );

        CREATE TABLE PreqCourse_course (
                prerequisite_course_id INT NOT NULL,
                course_id              INT NOT NULL,
                CONSTRAINT prerequisite_course_id_course_id_PK_PreqCourse_course PRIMARY KEY (prerequisite_course_id,course_id),
                CONSTRAINT prerequisite_course_id_FK_PreqCourse_course           FOREIGN KEY (prerequisite_course_id) REFERENCES Course,
                CONSTRAINT course_id_FK_PreqCourse_course                        FOREIGN KEY (course_id)              REFERENCES Course

        );

        CREATE TABLE Instructor (
                instructor_id INT PRIMARY KEY,
                name          VARCHAR(40) NOT NULL,
                email         VARCHAR(40) NOT NULL,
                faculty       VARCHAR(40) NOT NULL,
                office        VARCHAR(40) NOT NULL,
        );

        CREATE TABLE Instructor_Course (
                course_id     INT NOT NULL,
                instructor_id INT NOT NULL,
                CONSTRAINT instructor_id_course_id_pk_constraint PRIMARY KEY (instructor_id,course_id),
                CONSTRAINT course_id_FK_Instructor_Course        FOREIGN KEY (course_id)     REFERENCES Course     ON UPDATE CASCADE ON DELETE CASCADE,
                CONSTRAINT instructor_id_FK_Instructor_Course    FOREIGN KEY (instructor_id) REFERENCES Instructor ON UPDATE CASCADE ON DELETE CASCADE,
        );

        CREATE TABLE Student_Instructor_Course_Take (
            student_id    INT NOT NULL,
            course_id     INT NOT NULL,
            instructor_id INT NOT NULL,
            semester_code VARCHAR(40)  NOT NULL,
            exam_type     VARCHAR(40)  DEFAULT 'Normal' CHECK (exam_type in ('Normal','First_makeup','Second_makeup')),
            grade         DECIMAL(3,2),
            CONSTRAINT course_id_instructor_id_student_id              PRIMARY KEY (instructor_id,course_id,student_id),
            CONSTRAINT course_id_FK_Student_Instructor_Course_Take     FOREIGN KEY (course_id)     REFERENCES Course,
            CONSTRAINT instructor_id_FK_Student_Instructor_Course_Take FOREIGN KEY (instructor_id) REFERENCES Instructor,
            CONSTRAINT student_id_FK_Student_Instructor_Course_Take    FOREIGN KEY (student_id)    REFERENCES Student (student_id)
        );

        CREATE TABLE Semester (
                semester_code VARCHAR(40) PRIMARY KEY NOT NULL,
                start_date    DATE NOT NULL,
                end_date      DATE NOT NULL,
        );

        CREATE TABLE Course_Semester (
                course_id     INT,
                semester_code VARCHAR(40) NOT NULL,
                CONSTRAINT course_id_semester_code_PK_Course_Semester PRIMARY KEY (course_id,semester_code),
                CONSTRAINT course_id_FK_Course_Semester               FOREIGN Key (course_id)     REFERENCES Course   (course_id)     ON UPDATE CASCADE ON DELETE CASCADE,
                CONSTRAINT semester_code_FK_Course_Semester           FOREIGN Key (semester_code) REFERENCES Semester (semester_code) ON UPDATE CASCADE ON DELETE CASCADE,
        );

        CREATE TABLE Slot (
            slot_id       INT PRIMARY KEY,
            day           VARCHAR(40) NOT NULL,
            time          INT         NOT NULL CHECK(time IN (1,2,3,4,5)),
            location      VARCHAR(40) NOT NULL,
            course_id     INT         NOT NULL,
            instructor_id INT         NOT NULL,
            CONSTRAINT course_id_FK_Slot     FOREIGN KEY (course_id)     REFERENCES Course     ON UPDATE CASCADE ON DELETE CASCADE,
            CONSTRAINT instructor_id_FK_Slot FOREIGN KEY (instructor_id) REFERENCES Instructor ON UPDATE CASCADE ON DELETE CASCADE,
        );


        CREATE TABLE Graduation_plan (
            plan_id                INT         NOT NULL,
            semester_code          VARCHAR(40) NOT NULL,
            semester_credit_hours  INT         NOT NULL,
            expected_grad_semester INT         NOT NULL,
            advisor_id             INT         NOT NULL,
            student_id             INT         NOT NULL,
            CONSTRAINT plan_id_semester_code_PK_Graduation_plan PRIMARY KEY (plan_id, semester_code),
            CONSTRAINT advisor_FK_Graduation_plan               FOREIGN KEY (advisor_id)    REFERENCES Advisor,
            CONSTRAINT student_FK_Graduation_plan               FOREIGN KEY (student_id)    REFERENCES Student (student_id),
        );


        CREATE TABLE GradPlan_Course (  --NOTE: I think here we should think about "ON DELETE/UPDATE CASCADE" cases ...
            plan_id       INT         NOT NULL,
            semester_code VARCHAR(40) NOT NULL,
            course_id     INT         NOT NULL,
            CONSTRAINT plan_id_semester_code_course_id_PK_GradPlan_Course PRIMARY KEY (plan_id,semester_code,course_id),
            CONSTRAINT plan_id_semester_code_FK_GradPlan_Course           FOREIGN KEY (plan_id, semester_code) REFERENCES Graduation_plan (plan_id, semester_code) ON UPDATE CASCADE ON DELETE CASCADE
        );

        CREATE TABLE Request (
            request_id   INT PRIMARY KEY IDENTITY ,
            type         VARCHAR(40),
            comment      VARCHAR(40),
            status       VARCHAR(40) DEFAULT 'pending' CHECK (status IN ('pending','accepted','rejected')),   --NOTE: �pending�(default), �accepted� or �rejected�.
            credit_hours INT,
            student_id   INT NOT NULL,
            advisor_id   INT NOT NULL,
            course_id    INT NOT NULL,
            CONSTRAINT student_id_FK_Request FOREIGN KEY (student_id) REFERENCES Student (student_id),
            CONSTRAINT advisor_id_FK_Request FOREIGN KEY (advisor_id) REFERENCES Advisor,
            CONSTRAINT course_id_FK_Request  FOREIGN KEY (course_id)  REFERENCES Course,
        );

        CREATE TABLE MakeUp_Exam (
            exam_id   INT PRIMARY KEY NOT NULL,
            date      DATE            NOT NULL,
            type      VARCHAR(40)     NOT NULL,
            course_id INT             NOT NULL,
            CONSTRAINT course_id_FK_MakeUp_Exam FOREIGN KEY (course_id) REFERENCES Course,
        );

        CREATE TABLE Exam_Student (
            exam_id    INT NOT NULL,
            student_id INT NOT NULL,
            course_id  INT NOT NULL,
            CONSTRAINT student_id_exam_id_PK_Exam_Student PRIMARY KEY (student_id,exam_id),
            CONSTRAINT exam_id_FK_Exam_Student            FOREIGN KEY (exam_id)    REFERENCES MakeUp_Exam          ON UPDATE CASCADE,
            CONSTRAINT student_id_FK_Exam_Student         FOREIGN KEY (student_id) REFERENCES Student (student_id) ON UPDATE CASCADE,
        );

        CREATE TABLE Payment (
            payment_id      INT PRIMARY KEY,
            amount          DECIMAL(10,5) NOT NULL,
            deadline        DATETIME      NOT NULL,
            n_installments  INT           NOT NULL,
            status          VARCHAR(40)   DEFAULT 'notPaid' CHECK (status IN ('notPaid','Paid')),
            fund_percentage DECIMAL(3,2)  CHECK (fund_percentage<=100.00 AND fund_percentage>=0.00),
            student_id      INT           NOT NULL,
            semester_code   VARCHAR(40)   NOT NULL,
            start_date      DATETIME      NOT NULL,
            CONSTRAINT student_FK_Payment       FOREIGN KEY (student_id)    REFERENCES Student (student_id) ON UPDATE CASCADE, --NOTE: Should we add "ON DELETE CASCADE" also?!
            CONSTRAINT semester_code_FK_Payment FOREIGN KEY (semester_code) REFERENCES Semester             ON UPDATE CASCADE, --NOTE: Should we add "ON DELETE CASCADE" also?!
        );


        CREATE TABLE Installment(
                payment_id INT           NOT NULL,
                deadline   DATE          NOT NULL,
                amount     DECIMAL(10,5) NOT NULL,
                status     BIT           NOT NULL,
                start_date DATE          NOT NULL,
                CONSTRAINT payment_id_deadline_PK_Installment    PRIMARY KEY (payment_id,deadline),
                CONSTRAINT payment_id_FK_Installment             FOREIGN KEY (payment_id) REFERENCES Payment ON UPDATE CASCADE ON DELETE CASCADE,
            );
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
        DROP TABLE IF EXISTS
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

CREATE VIEW view_Course_prerequisites
    AS
        SELECT C.course_id,
               C.name,
               C.major,
               C.is_offered,
               C.credit_hours,
               C.semester,
               PC.prerequisite_course_id
        FROM Course C
        LEFT JOIN PreqCourse_course PC
        ON (C.course_id = PC.course_id);
    GO

CREATE VIEW Instructors_AssignedCourses
    AS
        SELECT  I.instructor_id,
                I.name,
                I.email,
                I.faculty,
                I.office,
                IC.course_id
        FROM Instructor I
        INNER JOIN Instructor_Course IC
        ON (I.instructor_id = IC.instructor_id);
    GO

CREATE VIEW Student_Payment
    AS
        SELECT P.amount,
               P.deadline,
               P.fund_percentage,
               P.n_installments,
               P.payment_id,
               P.semester_code,
               P.start_date,
               P.status,
               S.*
        FROM Payment P
        INNER Join Student S
        ON (P.payment_id = S.student_id);
    GO

CREATE VIEW Courses_Slots_Instructor
    AS
        SELECT  C.course_id,
                C.name as course_name,
                S.slot_id,
                S.day,
                S.time,
                S.location,
                I.name as instructor_name
        FROM Course C
        INNER Join Slot S
        ON (C.course_id = S.course_id)
            INNER Join Instructor I
            ON (I.instructor_id = S.instructor_id);
    GO

CREATE VIEW Courses_MakeupExams
    AS
        SELECT C.name,
               C.semester,
               ME.course_id,
               ME.date,
               ME.exam_id,
               ME.type
        FROM Course C
        INNER Join MakeUp_Exam ME
        ON (C.course_id = ME.course_id);
    GO

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
        INSERT INTO Student (f_name,l_name,password,faculty,email,major,semester) VALUES (@first_name,@last_name,@password,@faculty,@email,@major,@Semester)
        SET @id = SCOPE_IDENTITY()
    GO

CREATE OR ALTER PROCEDURE Procedures_AdvisorRegistration
    @advisor_name VARCHAR(40),
    @password VARCHAR(40),
    @email VARCHAR(40),
    @office VARCHAR(40),
    @id INT OUTPUT
    AS
        INSERT INTO Advisor (name,password,email,office) VALUES (@advisor_name,@password,@email,@office)
        SET @id = SCOPE_IDENTITY()
    GO

CREATE OR ALTER PROCEDURE Procedures_AdminListStudents
    AS
        SELECT * FROM Student
    GO

CREATE OR ALTER VIEW Advisors_Graduation_Plan
    As
        Select  g.*,
                a.advisor_id,
                a.name AS Advisor_name
        FROM Graduation_plan g
        FULL OUTER JOIN Advisor a
        ON g.advisor_id = a.Advisor_id
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

CREATE OR ALTER PROCEDURE Procedures_AdminAddingCourse
    @major varchar (40), 
    @semester int, 
    @credit_hours int,
    @course_name varchar (40),
    @offered bit
    AS
        INSERT INTO Course 
            (major,semester,credit_hours,name,is_offered)
        VALUES
            (@major,@semester,@credit_hours,@course_name,@offered)
    GO        

CREATE OR ALTER VIEW view_Students
    AS
        SELECT *
        From Student
    GO

CREATE OR ALTER VIEW Students_Courses_transcript
    AS

        SELECT x.student_id, s.f_name+' '+s.l_name as Student_Name, x.course_id, c.name AS Course_NAME, s.semester, x.exam_type, i.name AS INSTRUCTOR_NAME
        From Student_Instructor_Course_Take x
            inner JOIN Student s On (x.student_id= s.student_id)
            inner JOIN Instructor i on (x.instructor_id = i.instructor_id)
            inner JOIN Course c on (x.course_id= c.course_id)
    GO

CREATE OR ALTER VIEW Semster_offered_Courses
AS
    SELECT s.course_id, s.semester_code, c.name
    FROM Course_Semester s
        inner JOIN Course c on s.course_id = s.course_id
    GO

CREATE OR ALTER PROCEDURE AdminAddingSemester
    @start_date date,
    @end_date date,
    @semester_code VARCHAR(40)
As
INSERT INTO Semester
    (start_date,end_date,semester_code)
VALUES
    (@start_date, @end_date, @semester_code)
    GO

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

CREATE VIEW all_Pending_Requests
    AS
        Select r.*, s.f_name +' '+ s.l_name as Student_name, a.name as Advisor_name
        from Request r inner join Student s on (r.student_id = s.student_id)
                       inner join Advisor a on (a.advisor_id = r.advisor_id)
        where r.status = 'pending';
    GO


CREATE OR ALTER PROCEDURE Procedures_AdminDeleteSlots
    @current_semester VARCHAR(40)
    AS
        DELETE s FROM Slot s
        JOIN Course c
            ON c.course_id=s.course_id
        JOIN Course_Semester cs
            ON  cs.course_id=c.course_id
        WHERE cs.semester_code=@current_semester AND c.is_offered=0
    GO
