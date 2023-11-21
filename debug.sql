USE Advising_Team_119



-- EXEC DropAllTables
exec CreateAllTables
INSERT INTO Advisor ( name, email,office,password)
VALUES ( 'Robert Johnson', 'robert.johnson@example.com', 'Engineering','cksjdn');
-- Insert statements for Student table
INSERT INTO Student ( f_name, l_name, gpa, faculty, email, major, password, semester, acquired_hours, assigned_hours, advisor_id)
VALUES ( 'John', 'Doe', 0.8, 'Engineering', 'john.doe@example.com', 'Computer Science', 'password123', 1, 1,  12, 1);

-- Insert statements for Student_Phone table
INSERT INTO Student_Phone (student_id, phone_number)
VALUES (1, '123-456-7890');

-- Insert statements for Course table
INSERT INTO Course (course_id, name, major, offered, credit_hours, semester)
VALUES (101, 'Database Management','ksns',1, 3, 3);

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
VALUES (6, 1001, 101, 88.00, 'First_makeup');

-- Insert statements for Semester table
INSERT INTO Semester (semester_code, start_date, end_date)
VALUES (1, '2023-09-01', '2023-12-15');

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