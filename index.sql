--CREATE DATABASE Advising_Team_119;



CREATE OR ALTER PROCEDURE CreateAllTables
    AS
        CREATE TABLE Advisor (
            advisor_id INT PRIMARY KEY,
            name DATE NOT NULL,
            email VARCHAR(40) NOT NULL ,
            office VARCHAR(40) NOT NULL ,
            password VARCHAR(40) NOT NULL
        )

        CREATE TABLE Student (
            student_id INT PRIMARY KEY,
            f_name VARCHAR(40) NOT NULL,
            l_name VARCHAR(40) NOT NULL,
            gpa DECIMAL(2,2) NOT NULL CHECK (gpa<=5.0 AND gpa>=0.7),
            faculty VARCHAR(40) NOT NULL,
            email VARCHAR(40) NOT NULL ,
            major VARCHAR(40) NOT NULL,
            password VARCHAR(40) NOT NULL,
            financial_status BIT ,
            semester INT NOT NULL,
            acquired_hours INT NOT NULL,
            assigned_hours INT NOT NULL,
            advisor_id INT NOT NULL,
            CONSTRAINT advisor_FK FOREIGN KEY (advisor_id) REFERENCES Advisor
            ON UPDATE CASCADE,
        )


        CREATE TABLE Course (
                course_id INT PRIMARY KEY,
                name VARCHAR(40) NOT NULL,
                major VARCHAR(40) NOT NULL,
                semester INT NOT NULL,
                credit_hours INT NOT NULL,
                course_name VARCHAR(40) NOT NULL ,
                offered BIT NOT NULL,
        );
        CREATE TABLE Student_Phone(
            student_id INT NOT NULL,
            phone_number VARCHAR(40) NOT NULL,
            CONSTRAINT student_phone_pk_constraint PRIMARY KEY(student_id,phone_number),
            CONSTRAINT student_id_FK FOREIGN KEY (student_id) REFERENCES Student
            ON UPDATE CASCADE
            ON DELETE CASCADE,
        )

        CREATE TABLE PreqCourse_course(
                prerequisite_course_id INT NOT NULL,
                course_id INT NOT NULL,
                CONSTRAINT prerequisite_course_id_course_id_pk_constraint PRIMARY KEY(prerequisite_course_id,course_id),
                CONSTRAINT prerequisite_course_id_FK FOREIGN KEY (prerequisite_course_id) REFERENCES Course,
                CONSTRAINT course_id_FK FOREIGN KEY (course_id) REFERENCES Course

        );
        CREATE TABLE Instructor(
                instructor_id INT PRIMARY KEY,
                name VARCHAR(40) NOT NULL,
                faculty VARCHAR(40) NOT NULL,
                email VARCHAR(40) NOT NULL ,
                office VARCHAR(40) NOT NULL,
        );

        CREATE TABLE Instructor_Course(
                course_id INT NOT NULL,
                instructor_id INT NOT NULL,
                CONSTRAINT instructor_id_course_id_pk_constraint PRIMARY KEY(instructor_id,course_id),
                CONSTRAINT course_id_FK_Instructor_Course FOREIGN KEY (course_id) REFERENCES Course
                ON UPDATE CASCADE,
                CONSTRAINT instructor_id_FK_Instructor_Course FOREIGN KEY (instructor_id) REFERENCES Instructor
                ON UPDATE CASCADE
                ON DELETE CASCADE,
        );

        CREATE TABLE Student_Instructor_Course_Take(
            course_id INT NOT NULL,
            instructor_id INT NOT NULL,
            student_id INT NOT NULL,
            semester_code INT ,
            exam_type VARCHAR(40)  default 'Normal' CHECK (exam_type in ('Normal','First_makeup','Second_makeup')),
            grade DECIMAL(3,2) DEFAULT NULL,
            CONSTRAINT course_id_instructor_id_student_id PRIMARY KEY(instructor_id,course_id,student_id),
            CONSTRAINT course_id_FK_Student_Instructor_Course_Take FOREIGN KEY (course_id) REFERENCES Course,
            CONSTRAINT instructor_id_FK_Student_Instructor_Course_Take FOREIGN KEY (instructor_id) REFERENCES Instructor,
            CONSTRAINT student_id_FK_Student_Instructor_Course_Take FOREIGN KEY (student_id) REFERENCES Student
        )

        CREATE TABLE Semester (
                semester_code INT PRIMARY KEY,
                start_date DATE NOT NULL,
                end_date DATE NOT NULL,
        );

        CREATE TABLE Course_Semester (
                course_id INT,
                semester_code INT,
                FOREIGN Key(course_id) REFERENCES Course (course_id) ON UPDATE CASCADE,
                FOREIGN Key(semester_code) REFERENCES Semester (semester_code) ON UPDATE CASCADE,
                FOREIGN Key(course_id) REFERENCES Course (course_id) ON DELETE CASCADE,
                FOREIGN Key(semester_code) REFERENCES Semester (semester_code) ON DELETE CASCADE,
                CONSTRAINT course_id_semester_code PRIMARY KEY(course_id,semester_code),
        );


        CREATE TABLE Slot(
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


        CREATE TABLE Graduation_plan (
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


        CREATE TABLE GradPlan_Course(
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

        CREATE TABLE Request (
            request_id INT PRIMARY KEY NOT NULL ,
            comment VARCHAR(255) ,
            status VARCHAR(40) DEFAULT 'pending' CHECK (status IN ('pending','accepted','rejected')),   --  ‘pending’(default), ‘accepted’ or ‘rejected’.
            credit_hours INT,
            advisor_id INT NOT NULL,
            student_id INT NOT NULL,
            course_id INT NOT NULL,
            CONSTRAINT advisor_FK_Request FOREIGN KEY(advisor_id) REFERENCES Advisor,
            CONSTRAINT student_FK_Request FOREIGN KEY(student_id) REFERENCES Student,
            CONSTRAINT course_FK_Request FOREIGN KEY(course_id) REFERENCES Course,
        );

        CREATE TABLE MakeUp_Exam(
            exam_id INT PRIMARY KEY NOT NULL,
            date DATE NOT NULL,
            type VARCHAR(40),
            course_id INT NOT NULL,
            CONSTRAINT course_FK_MakeUp_Exam FOREIGN KEY(course_id) REFERENCES Course,
        )

        CREATE TABLE Exam_Student(
            student_id INT NOT NULL,
            exam_id INT  NOT NULL,
            course_id INT NOT NULL,
            CONSTRAINT student_id_course_id_exam_id PRIMARY KEY(student_id,exam_id,course_id),
            CONSTRAINT exam_FK_Exam_Student FOREIGN KEY(exam_id) REFERENCES MakeUp_Exam
                ON UPDATE CASCADE,
            CONSTRAINT student_FK_Exam_Student FOREIGN KEY(student_id) REFERENCES Student
                ON UPDATE CASCADE,
            CONSTRAINT course_FK_Exam_Student FOREIGN KEY(course_id) REFERENCES Course
                ON UPDATE CASCADE,
        )

        CREATE TABLE Payment(
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


        CREATE TABLE Installment(
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
        DECLARE @command VARCHAR(255)   -- variable to store the command
        DECLARE pointer CURSOR FAST_FORWARD READ_ONLY FOR -- declaring the row pointer
            SELECT CONCAT('ALTER TABLE ', TABLE_SCHEMA, '.[', TABLE_NAME, '] DROP CONSTRAINT [', CONSTRAINT_NAME, ']') AS Name
            FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
            WHERE CONSTRAINT_TYPE = 'FOREIGN KEY'
        OPEN pointer -- intializing the pointer

        FETCH NEXT FROM pointer INTO @command -- store teh row result in the command variable

        WHILE @@FETCH_STATUS=0 -- while there are still results(rows)
            BEGIN
                EXEC(@command) -- exceute the command
                FETCH NEXT FROM pointer INTO @command  -- set the next result in teh command
            END
        CLOSE pointer -- closse the cursor
        DEALLOCATE pointer -- remove it from memory
    GO;

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
