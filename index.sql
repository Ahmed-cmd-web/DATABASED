--CREATE DATABASE Advising_Team_119;

CREATE PROCEDURE CreateAllTables
    AS
        CREATE TABLE Advisor (
            advisor_id INT PRIMARY KEY,
            name DATE NOT NULL,
            email VARCHAR(40) NOT NULL ,
            office VARCHAR(40) NOT NULL ,
            password VARCHAR(40) NOT NULL
        );

        CREATE TABLE Student (
            student_id INT PRIMARY KEY,
            f_name VARCHAR(40) NOT NULL,
            l_name VARCHAR(40) NOT NULL,
            gpa DECIMAL(2,2) NOT NULL CHECK (gpa<=5.0 AND gpa>=0.7),
            faculty VARCHAR(40) NOT NULL,
            email VARCHAR(40) NOT NULL ,
            major VARCHAR(40) NOT NULL,
            password VARCHAR(40) NOT NULL,
            financial_status BIT ,   -- needs a function
            semester INT NOT NULL,
            acquired_hours INT NOT NULL,
            assigned_hours INT NOT NULL,
            advisor_id INT NOT NULL,
            CONSTRAINT advisor_FK FOREIGN KEY (advisor_id) REFERENCES Advisor
            ON UPDATE CASCADE,
        );

        CREATE TABLE Student_Phone(
            student_id INT NOT NULL,
            phone_number VARCHAR(40) NOT NULL,
            CONSTRAINT student_phone_pk_constraint PRIMARY KEY(student_id,phone_number),
            CONSTRAINT student_id_FK FOREIGN KEY (student_id) REFERENCES Student
            ON UPDATE CASCADE
            ON DELETE CASCADE,
        )


    -- Ahmed mohammed
        CREATE TABLE Course (
                course_id INT PRIMARY KEY,
                name VARCHAR(40) NOT NULL,
                major VARCHAR(40) NOT NULL,
                semester INT NOT NULL,
                credit_hours INT NOT NULL,
                course_name VARCHAR(40) NOT NULL ,
                offered BIT NOT NULL,
        );

        CREATE TABLE PreqCourse_course(
                prerequisite_course_id INT NOT NULL,
                course_id INT NOT NULL,
                CONSTRAINT prerequisite_course_id_course_id_pk_constraint PRIMARY KEY(prerequisite_course_id,course_id),
                CONSTRAINT prerequisite_course_id_FK FOREIGN KEY (prerequisite_course_id) REFERENCES Course
                ON UPDATE CASCADE
                ON DELETE CASCADE,
                CONSTRAINT course_id_FK FOREIGN KEY (course_id) REFERENCES Course
                ON UPDATE CASCADE,
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
                CONSTRAINT prerequisite_course_id_course_id_pk_constraint PRIMARY KEY(instructor_id,course_id),
                CONSTRAINT course_id_FK FOREIGN KEY (course_id) REFERENCES Course
                ON UPDATE CASCADE,
                CONSTRAINT instructor_id_FK FOREIGN KEY (instructor_id) REFERENCES Instructor
                ON UPDATE CASCADE
                ON DELETE CASCADE,
        );


        CREATE TABLE Graduation_plan (
            plan_id INT NOT NULL,
            semester_code VARCHAR(40) NOT NULL,
            major VARCHAR(40) NOT NULL,
            expected_grad_semester INT NOT NULL,
            semester_credit_hours INT NOT NULL,
            course_name VARCHAR(40) NOT NULL ,
            offered BIT NOT NULL,
            advisor_id INT NOT NULL,
            student_id INT NOT NULL,
            CONSTRAINT PK_Content PRIMARY KEY (plan_id, semester_code),
            CONSTRAINT advisor_FK FOREIGN KEY(advisor_id) REFERENCES Advisor
            ON UPDATE CASCADE,
            CONSTRAINT student_FK FOREIGN KEY(student_id) REFERENCES Student
            ON UPDATE CASCADE,
        );


        CREATE TABLE GradPlan_Course(
            plan_id INT NOT NULL ,
            semester_code VARCHAR(40) NOT NULL,
            student_id INT NOT NULL,
            CONSTRAINT plan_id_course_code_student_id PRIMARY KEY(plan_id,semester_code,student_id),
            CONSTRAINT student_id_FK FOREIGN KEY (student_id) REFERENCES Student
                ON UPDATE CASCADE
                ON DELETE CASCADE,
            CONSTRAINT grad_plan_FK FOREIGN KEY (plan_id,semester_code) REFERENCES Graduation_plan
                ON UPDATE CASCADE
                ON DELETE CASCADE,
        );


        CREATE TABLE Slot(
            slot_id INT PRIMARY KEY,
            day VARCHAR(40) NOT NULL,
            time time NOT NULL,
            location VARCHAR(40) NOT NULL ,
            course_id INT NOT NULL,
            instructor_id INT NOT NULL,
            CONSTRAINT course_FK FOREIGN KEY(course_id) REFERENCES Course
            ON UPDATE CASCADE,
            CONSTRAINT instructor_FK FOREIGN KEY(instructor_id) REFERENCES Instructor
            ON UPDATE CASCADE,
        );


    -- Mostafa

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
                FOREIGN Key(semester_code) REFERENCES Semester (semester_code) ON DELETE CASCADE

        );



    GO;