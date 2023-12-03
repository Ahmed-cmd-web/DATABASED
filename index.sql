-- Description : Milestone_2_Database_Project
-- Team : 119
-- Authors : Ahmed Said, Ahmed Mohammed, Mostafa Ahmed , Ahmed Hossam , Mohammed Youssef
-- Due_Date : 2023-12-1

--CREATE DATABASE Advising_Team_119;

USE Advising_Team_119;

    GO


CREATE OR ALTER PROCEDURE CreateAllTables
AS
CREATE TABLE Advisor
(
    advisor_id INT PRIMARY KEY IDENTITY,
    name VARCHAR(40) NOT NULL,
    email VARCHAR(40) NOT NULL,
    office VARCHAR(40) NOT NULL,
    password VARCHAR(40) NOT NULL
);

CREATE TABLE Student
(
    student_id INT PRIMARY KEY IDENTITY,
    f_name VARCHAR(40) NOT NULL,
    l_name VARCHAR(40) NOT NULL,
    gpa DECIMAL(3,2) CHECK (gpa<=5.0 AND gpa>=0.7),
    faculty VARCHAR(40) NOT NULL,
    email VARCHAR(40) NOT NULL,
    major VARCHAR(40) NOT NULL,
    password VARCHAR(40) NOT NULL,
    financial_status  AS dbo.is_blocked(student_id) ,
    semester INT NOT NULL,
    acquired_hours INT          ,
    assigned_hours INT          ,
    advisor_id INT          ,
    CONSTRAINT advisor_FK_Student FOREIGN KEY (advisor_id) REFERENCES Advisor ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE Course
(
    course_id INT PRIMARY KEY IDENTITY,
    name VARCHAR(40) NOT NULL,
    major VARCHAR(40) NOT NULL,
    is_offered BIT NOT NULL,
    credit_hours INT NOT NULL,
    semester INT NOT NULL,
);

CREATE TABLE Student_Phone
(
    student_id INT NOT NULL,
    phone_number VARCHAR(40) NOT NULL,
    CONSTRAINT student_id_phone_number_PK_Student_Phone PRIMARY KEY (student_id,phone_number),
    CONSTRAINT student_id_FK_Student_Phone              FOREIGN KEY (student_id) REFERENCES Student (student_id) ON UPDATE CASCADE ON DELETE CASCADE,
);

CREATE TABLE PreqCourse_course
(
    prerequisite_course_id INT ,
    course_id INT ,
    CONSTRAINT prerequisite_course_id_course_id_PK_PreqCourse_course PRIMARY KEY (prerequisite_course_id,course_id),
    CONSTRAINT prerequisite_course_id_FK_PreqCourse_course           FOREIGN KEY (prerequisite_course_id) REFERENCES Course,
    CONSTRAINT course_id_FK_PreqCourse_course                        FOREIGN KEY (course_id)              REFERENCES Course,
);

CREATE TABLE Instructor
(
    instructor_id INT PRIMARY KEY IDENTITY,
    name VARCHAR(40) NOT NULL,
    email VARCHAR(40) NOT NULL,
    faculty VARCHAR(40) NOT NULL,
    office VARCHAR(40) NOT NULL,
);

CREATE TABLE Instructor_Course
(
    course_id INT NOT NULL,
    instructor_id INT NOT NULL,
    CONSTRAINT instructor_id_course_id_pk_constraint PRIMARY KEY (instructor_id,course_id),
    CONSTRAINT course_id_FK_Instructor_Course        FOREIGN KEY (course_id)     REFERENCES Course     ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT instructor_id_FK_Instructor_Course    FOREIGN KEY (instructor_id) REFERENCES Instructor ON UPDATE CASCADE ON DELETE CASCADE,
);

CREATE TABLE Student_Instructor_Course_Take
(
    student_id INT NOT NULL,
    course_id INT NOT NULL,
    instructor_id INT ,
    semester_code VARCHAR(40) NOT NULL,
    exam_type VARCHAR(40) DEFAULT 'Normal' CHECK (exam_type IN ('Normal','First_makeup','Second_makeup')),
    grade VARCHAR(40) DEFAULT  NULL CHECK (grade     IN ('A','A+','A-','B','B+','B-',
                                                                              'C','C+','C-','D','D+','F','FF')),
    CONSTRAINT course_id_semester_code_student_id              PRIMARY KEY (course_id,semester_code,student_id),
    CONSTRAINT course_id_FK_Student_Instructor_Course_Take     FOREIGN KEY (course_id)     REFERENCES Course ON DELETE CASCADE,
    CONSTRAINT instructor_id_FK_Student_Instructor_Course_Take FOREIGN KEY (instructor_id) REFERENCES Instructor,
    CONSTRAINT student_id_FK_Student_Instructor_Course_Take    FOREIGN KEY (student_id)    REFERENCES Student (student_id)
);

CREATE TABLE Semester
(
    semester_code VARCHAR(40) PRIMARY KEY NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
);

CREATE TABLE Course_Semester
(
    course_id INT,
    semester_code VARCHAR(40) NOT NULL,
    CONSTRAINT course_id_semester_code_PK_Course_Semester PRIMARY KEY (course_id,semester_code),
    CONSTRAINT course_id_FK_Course_Semester               FOREIGN Key (course_id)     REFERENCES Course   (course_id)     ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT semester_code_FK_Course_Semester           FOREIGN Key (semester_code) REFERENCES Semester (semester_code) ON UPDATE CASCADE ON DELETE CASCADE,
);

CREATE TABLE Slot
(
    slot_id INT PRIMARY KEY IDENTITY,
    day VARCHAR(40) NOT NULL,
    time VARCHAR(40) NOT NULL CHECK(time IN ('First','Second','Third','Fourth','Fifth')),
    location VARCHAR(40) NOT NULL,
    course_id INT,
    instructor_id INT,
    CONSTRAINT course_id_FK_Slot     FOREIGN KEY (course_id)     REFERENCES Course     ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT instructor_id_FK_Slot FOREIGN KEY (instructor_id) REFERENCES Instructor ON UPDATE CASCADE ON DELETE CASCADE,
);


CREATE TABLE Graduation_plan
(
    plan_id INT IDENTITY NOT NULL,
    semester_code VARCHAR(40) NOT NULL,
    semester_credit_hours INT NOT NULL,
    expected_grad_date DATE NOT NULL,
    advisor_id INT NOT NULL,
    student_id INT NOT NULL,
    CONSTRAINT plan_id_semester_code_PK_Graduation_plan PRIMARY KEY (plan_id, semester_code),
    CONSTRAINT advisor_FK_Graduation_plan               FOREIGN KEY (advisor_id)    REFERENCES Advisor,
    CONSTRAINT student_FK_Graduation_plan               FOREIGN KEY (student_id)    REFERENCES Student (student_id),
);


CREATE TABLE GradPlan_Course
(
    plan_id INT NOT NULL,
    semester_code VARCHAR(40) NOT NULL,
    course_id INT NOT NULL,
    CONSTRAINT plan_id_semester_code_course_id_PK_GradPlan_Course PRIMARY KEY (plan_id,semester_code,course_id),
    CONSTRAINT plan_id_semester_code_FK_GradPlan_Course           FOREIGN KEY (plan_id, semester_code) REFERENCES Graduation_plan (plan_id, semester_code) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE Request
(
    request_id INT PRIMARY KEY IDENTITY ,
    type VARCHAR(40),
    comment VARCHAR(40),
    status VARCHAR(40) DEFAULT 'pending' CHECK (status IN ('pending','accepted','rejected')),
    credit_hours INT,
    student_id INT ,
    advisor_id INT ,
    course_id INT ,
    CONSTRAINT student_id_FK_Request FOREIGN KEY (student_id) REFERENCES Student (student_id),
    CONSTRAINT advisor_id_FK_Request FOREIGN KEY (advisor_id) REFERENCES Advisor,
    CONSTRAINT course_id_FK_Request  FOREIGN KEY (course_id)  REFERENCES Course ON DELETE SET NULL,
    CHECK ( (credit_hours IS NULL AND course_id IS NOT NULL) OR (credit_hours IS NOT NULL AND course_id IS NULL))    -- NOTE: This is a XOR constraint (either credit_hours or course_id is NULL)
);

CREATE TABLE MakeUp_Exam
(
    exam_id INT PRIMARY KEY IDENTITY NOT NULL,
    date DATE NOT NULL,
    type VARCHAR(40) NOT NULL,
    course_id INT ,
    CONSTRAINT course_id_FK_MakeUp_Exam FOREIGN KEY (course_id) REFERENCES Course ON DELETE CASCADE,
);

CREATE TABLE Exam_Student
(
    exam_id INT NOT NULL,
    student_id INT NOT NULL,
    course_id INT NOT NULL,
    CONSTRAINT student_id_exam_id_PK_Exam_Student PRIMARY KEY (student_id,exam_id),
    CONSTRAINT exam_id_FK_Exam_Student            FOREIGN KEY (exam_id)    REFERENCES MakeUp_Exam          ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT student_id_FK_Exam_Student         FOREIGN KEY (student_id) REFERENCES Student (student_id) ON UPDATE CASCADE,
);

CREATE TABLE Payment
(
    payment_id INT PRIMARY KEY IDENTITY,
    amount DECIMAL NOT NULL,
    deadline DATETIME NOT NULL,
    n_installments INT NOT NULL,
    status VARCHAR(40) DEFAULT 'notPaid' CHECK (status IN ('notPaid','Paid')),
    fund_percentage DECIMAL(5,2) CHECK (fund_percentage<=100.00 AND fund_percentage>=0.00),
    start_date DATETIME NOT NULL,
    student_id INT NOT NULL,
    semester_code VARCHAR(40) NOT NULL,
    CONSTRAINT student_FK_Payment       FOREIGN KEY (student_id)    REFERENCES Student (student_id) ON UPDATE CASCADE,
    --NOTE: Should we add "ON DELETE CASCADE" also?!
    CONSTRAINT semester_code_FK_Payment FOREIGN KEY (semester_code) REFERENCES Semester             ON UPDATE CASCADE,
    --NOTE: Should we add "ON DELETE CASCADE" also?!
);


CREATE TABLE Installment
(
    payment_id INT NOT NULL,
    deadline DATETIME NOT NULL,
    amount INT NOT NULL,
    status VARCHAR(40) DEFAULT 'notPaid' CHECK (status IN ('notPaid','Paid')),
    start_date DATETIME NOT NULL,
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

CREATE OR ALTER VIEW view_Course_prerequisites
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

CREATE OR ALTER VIEW Instructors_AssignedCourses
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

CREATE OR ALTER VIEW Student_Payment
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

CREATE OR ALTER VIEW Courses_Slots_Instructor
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

CREATE OR ALTER VIEW Courses_MakeupExams
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

Create OR ALTER FUNCTION is_blocked(@student_id int) RETURNS BIT
    AS
        BEGIN
            RETURN IIF(EXISTS(SELECT * FROM Installment i
            INNER JOIN Payment p ON p.payment_id=i.payment_id
            WHERE p.student_id=@student_id AND GETDATE() > i.deadline AND i.status='notPaid'),0,1)
        END
    GO


CREATE OR ALTER TRIGGER set_student_status ON Installment FOR INSERT,UPDATE,DELETE
    AS
        UPDATE Student
        SET financial_status=dbo.is_blocked(student_id)
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
INSERT INTO Student
    (f_name,l_name,password,faculty,email,major,semester)
VALUES
    (@first_name, @last_name, @password, @faculty, @email, @major, @Semester)
SET @id = SCOPE_IDENTITY()
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
SET @id = SCOPE_IDENTITY()
    GO

CREATE OR ALTER PROCEDURE Procedures_AdminAddExam
    @Type VARCHAR(40),
    @date DATETIME,
    @courseID INT
AS
INSERT INTO MakeUp_Exam
    (date,type,course_id)
VALUES
    (@date, @Type, @courseID)
    GO

CREATE OR ALTER PROCEDURE Procedures_AdminListStudents
AS
SELECT *
FROM Student
    GO

CREATE OR ALTER VIEW Advisors_Graduation_Plan
As
    Select g.*,
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
    (@major, @semester, @credit_hours, @course_name, @offered)
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
    @start_date DATE,
    @end_date DATE,
    @semester_code VARCHAR(40)
AS
INSERT INTO Semester
    (start_date,end_date,semester_code)
VALUES
    (@start_date, @end_date, @semester_code)
    GO

CREATE OR ALTER PROCEDURE Procedures_ViewRequiredCourses
    @StudentID INT,
    @Current_semester_code Varchar(40)
AS
SELECT c.*
FROM Course c
    JOIN Student_Instructor_Course_Take sict
    ON sict.course_id=c.course_id
WHERE sict.student_id=@StudentID AND sict.semester_code=@Current_semester_code
    GO


CREATE OR ALTER FUNCTION FN_StudentCheckSMEligiability(
    @CourseID INT,
    @StudentID INT
    )
    RETURNS BIT
        AS BEGIN
        DECLARE @grade VARCHAR(40);
        DECLARE @failed_courses_count INT;
        SET @grade=(SELECT grade FROM Student_Instructor_Course_Take
            WHERE course_id=@CourseID AND student_id=@StudentID AND exam_type='First_makeup')

        SET @failed_courses_count=(SELECT COUNT(*) FROM Student_Instructor_Course_Take
                                        WHERE student_id=@StudentID AND grade IN ('F','FF'))
        RETURN IIF((@grade=NULL OR @grade IN ('F','FF')) AND @failed_courses_count<=2,1,0)
    END
    GO
CREATE OR ALTER PROCEDURE Procedures_AdvisorCreateGP
    @semester_code VARCHAR(40),
    @expected_graduation_date DATE,
    @semester_credit_hours INT,
    @advisor_id INT,
    @student_id INT
    AS
    BEGIN
        IF EXISTS(
            SELECT *
            FROM Student
            WHERE student_id=@student_id AND acquired_hours > 157
        ) AND EXISTS(
            SELECT *
            FROM Advisor
            WHERE advisor_id=@advisor_id
        )AND NOT EXISTS(
            SELECT *
            FROM Graduation_Plan GP
            WHERE GP.advisor_id=@advisor_id AND GP.semester_code=@semester_code AND GP.student_id=@student_id
        )
        BEGIN
            INSERT INTO Graduation_plan (semester_code,expected_grad_date,semester_credit_hours,advisor_id,student_id)
            VALUES (@semester_code,@expected_graduation_date,@semester_credit_hours,@advisor_id,@student_id)
        END
        ELSE
        BEGIN
            PRINT 'ERROR'
        END
    END
    GO

CREATE OR ALTER VIEW all_Pending_Requests
    AS
        SELECT r.*, s.f_name +' '+ s.l_name as Student_name, a.name as Advisor_name
        FROM Request r inner join Student s on (r.student_id = s.student_id)
                       inner join Advisor a on (a.advisor_id = r.advisor_id)
        WHERE r.status = 'pending';
    GO

CREATE OR ALTER PROCEDURE Procedures_ChooseInstructor
    @Student_ID INT,
    @Instructor_ID INT,
    @Course_ID INT
    AS
    BEGIN
       IF EXISTS(
               SELECT *
                FROM Instructor_Course IC
                WHERE IC.course_id = @Course_ID AND IC.instructor_id = @Instructor_ID
               )
         BEGIN
                DECLARE @semester_code VARCHAR(40);

                SELECT @semester_code = GP.semester_code
                FROM Graduation_plan GP
                INNER JOIN GradPlan_Course GPC
                ON GP.plan_id=GPC.plan_id AND GP.semester_code=GPC.semester_code
                WHERE GP.student_id=@Student_ID AND GPC.course_id=@Course_ID

                INSERT INTO Student_Instructor_Course_Take (student_id,course_iD,instructor_id,semester_code)
                VALUES (@Student_ID,@Course_ID,@Instructor_ID,@semester_code);
         END
         ELSE
         BEGIN
            PRINT 'The choosen instructor does not teach that specified course'
         END

    END;
    GO

CREATE OR ALTER FUNCTION FN_AdvisorLogin(@ID INT,@password VARCHAR(40))
    RETURNS BIT
    AS
        BEGIN
    RETURN IIF (EXISTS (SELECT * FROM Advisor
                            WHERE advisor_id=@ID AND password=@password),1,0)
END
    GO

CREATE OR ALTER PROCEDURE Procedures_StudentRegisterFirstMakeup
    @StudentID INT,
    @courseID INT,
    @Student_Current_Semester VARCHAR(40)
        AS
            DECLARE @sem_start_date DATE;
            DECLARE @sem_end_date DATE;
            SELECT @sem_start_date=start_date , @sem_end_date=end_date FROM Semester
                WHERE semester_code=@Student_Current_Semester

            DECLARE @exam INT;
            SELECT @exam=ME.exam_id FROM MakeUp_Exam ME
                WHERE (ME.date BETWEEN @sem_start_date AND @sem_end_date)
                            AND ME.course_id=@courseID AND ME.type='First_makeup'
            INSERT INTO Exam_Student VALUES (@StudentID,@exam,@courseID)
        GO




CREATE OR ALTER PROCEDURE Procedures_AdminDeleteCourse
    @courseID INT
    AS
        DELETE FROM PreqCourse_course WHERE course_id=@courseID OR prerequisite_course_id=@courseID
        DELETE FROM Course WHERE course_id=@courseID
        DELETE FROM Slot WHERE course_id=@courseID
    GO

CREATE OR ALTER PROCEDURE Procedures_AdminIssueInstallment
    @paymentID INT
AS
DECLARE @installment_amount DECIMAL(10,2);
DECLARE @start_date DATETIME;
DECLARE @deadline DATETIME;

SELECT @installment_amount=amount/n_installments, @start_date=start_date, @deadline=deadline
FROM Payment
WHERE payment_id=@paymentID

WHILE (@start_date<=@deadline)
            BEGIN
    INSERT INTO Installment
    VALUES
        (@paymentID, DATEADD(MONTH,1,@start_date), @installment_amount, 'notPaid', @start_date)
    SET @start_date=DATEADD(MONTH,1,@start_date)
END
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



CREATE OR ALTER PROCEDURE Procedures_AdvisorUpdateGP
    @expected_grad_date DATE,
    @studentID INT
    AS
        DECLARE @student_exists BIT;
        SET @student_exists=IIF(EXISTS(SELECT * FROM Graduation_Plan WHERE  student_id=@studentID),1,0)

        IF @student_exists=1
            UPDATE Graduation_plan
            SET expected_grad_date=@expected_grad_date
            WHERE student_id=@studentID
        ELSE
            PRINT 'expected semester or student does not exist'
    GO

CREATE OR ALTER FUNCTION FN_StudentViewSlot(@CourseID int,@InstructorID int)
    RETURNS Table
    AS
        RETURN
        (select Slot.time,Slot.location,slot.day,Slot.slot_id,Instructor.name AS Instructor_name,Course.name AS Course_name
        from Slot
        inner join Instructor on Slot.instructor_id = Instructor.instructor_id
        inner join Course on Slot.course_id = Course.course_id
        );
    GO

CREATE OR ALTER PROCEDURE Procedures_AdminLinkInstructor
    @InstructorId int,
    @courseId int,
    @slotID int
    AS
        IF EXISTS (SELECT * FROM Instructor_Course WHERE course_id = @courseId AND instructor_id = @InstructorId )
            BEGIN
                UPDATE Slot
                SET instructor_id = @InstructorId , course_id = @courseId
                WHERE slot_id = @slotID
            END

        ELSE
            BEGIN
                INSERT INTO Instructor_Course(course_id,instructor_id)
                VALUES(@courseId,@InstructorId)
                UPDATE Slot
                SET instructor_id = @InstructorId , course_id = @courseId
                WHERE slot_id = @slotID
            END

    GO


CREATE OR ALTER PROCEDURE Procedures_AdminLinkStudent
    @Instructor_Id int,
    @student_ID int,
    @course_ID int,
    @semester_code varchar (40)
    AS
        INSERT INTO Student_Instructor_Course_Take(student_id, course_id, instructor_id, semester_code)
        VALUES(@student_ID, @course_ID, @Instructor_Id, @semester_code)
    GO



CREATE OR ALTER PROCEDURE Procedures_AdminLinkStudentToAdvisor
    @studentID INT,
    @advisorID INT
    AS
        UPDATE Student
            SET advisor_id=@advisorID
            WHERE student_id=@studentID
    GO


CREATE OR ALTER PROCEDURE Procedures_ViewMS
    @StudentID INT
    AS
        WITH TakenCourses AS (
            SELECT sict.course_id,sict.grade
            FROM Student_Instructor_Course_Take sict
            WHERE sict.student_id = @StudentID
        ),
        AllCourses_InStudentGradPlan AS (
            SELECT GPC.course_id
            FROM Graduation_Plan GP
            INNER JOIN GradPlan_Course GPC
            ON GP.plan_id = GPC.plan_id AND GP.semester_code = GPC.semester_code
            WHERE GP.student_id = @StudentID
        ),
        MissingCourses AS (
            SELECT ac.course_id
            FROM AllCourses_InStudentGradPlan ac
            LEFT JOIN TakenCourses tc
            ON ac.course_id = tc.course_id
            WHERE tc.grade IN ('F','FF','FA') OR tc.grade IS NULL
        )
        SELECT
            mc.course_id,
            c.name AS course_name,
            c.major,
            c.is_offered,
            c.credit_hours,
            c.semester
        FROM MissingCourses mc
        INNER JOIN Course c
        ON mc.course_id = c.course_id;
    GO

CREATE OR ALTER FUNCTION FN_StudentViewSlot(@CourseID int,@InstructorID int)
    RETURNS Table
    AS
        RETURN
        (select Slot.time,Slot.location,slot.day,Slot.slot_id,Instructor.name AS Instructor_name,Course.name AS Course_name
        from Slot
        inner join Instructor on Slot.instructor_id = Instructor.instructor_id
        inner join Course on Slot.course_id = Course.course_id
        );
    GO

CREATE OR ALTER PROCEDURE Procedures_AdminLinkInstructor
    @InstructorId int,
    @courseId int,
    @slotID int
    AS

            BEGIN
                UPDATE Slot
                SET instructor_id = @InstructorId , course_id = @courseId
                WHERE slot_id = @slotID
            END
    GO


CREATE OR ALTER PROCEDURE Procedures_AdminLinkStudent
    @Instructor_Id int,
    @student_ID int,
    @course_ID int,
    @semester_code varchar (40)
    AS
        INSERT INTO Student_Instructor_Course_Take(student_id, course_id, instructor_id, semester_code)
        VALUES(@student_ID, @course_ID, @Instructor_Id, @semester_code)
    GO



CREATE OR ALTER PROCEDURE Procedures_AdminLinkStudentToAdvisor
    @studentID INT,
    @advisorID INT
    AS
        UPDATE Student
            SET advisor_id=@advisorID
            WHERE student_id=@studentID
    GO

CREATE OR ALTER PROCEDURE Procedures_AdvisorAddCourseGP
    @student_id INT,
    @semester_code Varchar(40),
    @course_name VARCHAR(40)
    AS
        DECLARE @Plan_id int
        SELECT @Plan_id = g.plan_id
        from Graduation_Plan g
        where g.student_id=@student_id and g.semester_code = @semester_code

        declare @course_id int
        Select @course_id = c.course_id
        from Course c
        where c.name = @course_name

        INSERT into GradPlan_Course
            (plan_id,semester_code,course_id)
        values
            (@Plan_id, @semester_code, @course_id)

    GO

CREATE OR ALTER FUNCTION FN_StudentViewGP (@Student_id int)
    RETURNS TABLE
        AS
           RETURN
           (select Student.student_id,concat(Student.f_name,Student.l_name)AS Student_name,Student.advisor_id,Graduation_plan.plan_id,Graduation_plan.semester_credit_hours,Graduation_plan.expected_grad_date,Course.course_id,
           Course.name,Graduation_Plan.semester_code
           from Student
           inner join Graduation_plan on Graduation_plan.student_id = Student.student_id
           inner join Gradplan_Course on Gradplan_Course.plan_id = Graduation_plan.plan_id
           inner join Course on Course.course_id = Gradplan_Course.course_id)
        GO


CREATE OR ALTER PROCEDURE Procedures_AdvisorDeleteFromGP
    @student_id int,
    @semester_code varchar(40),
    @course_id int
    AS
        DECLARE @Plan_id INT
        select @Plan_id = GP.plan_id from Graduation_plan GP where GP.semester_code= @semester_code and  GP.student_id = @student_id

        DELETE FROM GradPlan_Course WHERE GradPlan_Course.course_id=@course_id and GradPlan_Course.plan_id = @Plan_id and GradPlan_Course.semester_code=@semester_code
    GO

CREATE OR ALTER FUNCTION FN_Advisors_Requests (@advisor_id int)
    RETURNS TABLE
    AS
        return (select * from Request where advisor_id =@advisor_id)
    GO



CREATE OR ALTER PROCEDURE Procedures_AdvisorViewPendingRequests
    @Advisor_ID INT 
    AS
        SELECT R.*
        FROM Request R
        WHERE R.status = 'pending' AND R.advisor_id = @Advisor_ID 
        AND R.student_id IS NOT NULL        
    GO
    
CREATE OR ALTER PROCEDURE Procedures_StudentaddMobile
    @StudentID INT,
    @mobile_number VARCHAR(40)
    AS
        INSERT INTO Student_Phone VALUES (@StudentID,@mobile_number);
    GO

CREATE OR ALTER PROCEDURE Procedures_AdvisorViewAssignedStudents
    @AdvisorID INT,
    @major VARCHAR(40)
    AS
        SELECT s.*,c.*
        FROM Student s
        INNER JOIN Student_Instructor_Course_Take sict
            ON s.student_id = sict.student_id
        INNER JOIN Course c
            ON sict.course_id = c.course_id
        WHERE s.advisor_id = @AdvisorID AND s.major = @major;
    GO


CREATE OR ALTER FUNCTION FN_SemsterAvailableCourses (@semster_code varchar (40))
    RETURNS Table
    AS
        return (SELECT s.* from Course s inner join Course_Semester c on (s.course_id=c.course_id) where c.semester_code=@semster_code)
    GO


CREATE OR ALTER FUNCTION FN_StudentLogin (@Student_id int,@password varchar (40))
    RETURNS BIT
    AS
        BEGIN
        DECLARE @OUTPUT BIT
        if exists (select * from Student where student_id = @Student_id and password = @password)
        set @OUTPUT = '1'
        ELSE
        set @OUTPUT = '0'
        RETURN @OUTPUT
        END
    GO


CREATE OR ALTER PROCEDURE Procedures_StudentSendingCHRequest
    @StudentID INT,
    @credit_hours INT,
    @type VARCHAR(40),
    @comment VARCHAR(40)
    AS
        INSERT INTO Request
            (type,comment,credit_hours,student_id,advisor_id)
        VALUES
            (@type,@comment,@credit_hours,@StudentID,(SELECT advisor_id FROM Student WHERE student_id=@StudentID))
    GO


CREATE OR ALTER PROCEDURE Procedures_StudentSendingCourseRequest
    @StudentID INT,
    @courseID INT,
    @type VARCHAR(40),
    @comment VARCHAR(40)
    AS
        INSERT INTO Request (type,comment,student_id,advisor_id,course_id)
        VALUES (@type,@comment,@StudentID,(SELECT advisor_id
        FROM Student
        WHERE student_id = @StudentID),@courseID);
    GO

CREATE OR ALTER PROCEDURE Procedures_AdvisorApproveRejectCourseRequest
    @RequestID INT,
    @current_semester_code VARCHAR(40)
    AS
        DECLARE @student_id INT;
        DECLARE @course_id INT;
        DECLARE @student_assigned_hours INT;
        DECLARE @course_hours INT;
        DECLARE @has_taken_all_prereqs BIT;
        DECLARE @is_course_in_current_sem BIT;

        -- get studentID
        SELECT @student_id=student_id,@course_id=course_id FROM Request
                WHERE request_id=@RequestID AND status='pending'

        -- get current assigned hours of the student
        SELECT @student_assigned_hours=assigned_hours FROM Student
                WHERE student_id=@student_id
        -- get course credit hours
        SELECT @course_hours=credit_hours FROM Course
                WHERE course_id=@course_id
        -- check if he has taken all the requested course prerequistes
        SET @has_taken_all_prereqs=IIF(EXISTS(SELECT prerequisite_course_id FROM PreqCourse_course
                                                    WHERE course_id=@course_id
                                                    EXCEPT
                                                    SELECT course_id FROM Student_Instructor_Course_Take
                                                        WHERE student_id=@student_id),0,1)
       -- check if the course is in the current semester
        SET @is_course_in_current_sem = IIF(EXISTS(SELECT * FROM Course_Semester
                                                        WHERE semester_code=@current_semester_code AND course_id=@course_id),1,0)

        IF @student_assigned_hours+@course_hours>34 OR @has_taken_all_prereqs=0 OR @is_course_in_current_sem=0
            BEGIN
                UPDATE Request
                SET status='rejected'
                WHERE request_id=@RequestID
            END
        ELSE
            BEGIN
                UPDATE Request
                SET status='accepted'
                WHERE request_id=@RequestID

                INSERT INTO Student_Instructor_Course_Take
                VALUES (@student_id,@course_id,NULL,@current_semester_code,'Normal',NULL)

                UPDATE Student
                    SET assigned_hours=@student_assigned_hours + @course_hours
                    WHERE student_id=@student_id
            END
    GO
