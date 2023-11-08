

--CREATE DATABASE Advising_Team_119;



CREATE PROCEDURE CreateAllTables
    AS
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
            assigned_hours INT NOT NULL
        );

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
    CREATE TABLE Instructor(
            instructor_id INT PRIMARY KEY,
            name VARCHAR(40) NOT NULL,
            faculty VARCHAR(40) NOT NULL,
            email VARCHAR(40) NOT NULL ,
            office VARCHAR(40) NOT NULL,
        );







    -- Mostafa

    CREATE TABLE Semester (
            semester_code INT PRIMARY KEY,
            start_date DATE NOT NULL,
            end_date DATE NOT NULL,
        );

    CREATE TABLE Advisor (
        advisor_id INT PRIMARY KEY,
        name DATE NOT NULL,
        email VARCHAR(40) NOT NULL ,
        office VARCHAR(40) NOT NULL ,
        password VARCHAR(40) NOT NULL
    );







    GO;