



Use Advising_Team_119
EXEC DropAllTables

EXEC CreateAllTables

-- Insert into Advisor
INSERT INTO Advisor (name, email, office, password)
VALUES ('John Doe', 'johndoe@example.com', 'Office 1', 'password123');

-- Insert into Student
INSERT INTO Student (f_name, l_name, gpa, faculty, email, major, password, financial_status, semester, acquired_hours, assigned_hours, advisor_id)
VALUES ('Jane', 'Doe', 3.5, 'Engineering', 'janedoe@example.com', 'Computer Science', 'password123', 1, 1, 30, 30, 1);

-- Insert into Course
INSERT INTO Course (name, major, is_offered, credit_hours, semester)
VALUES ('Database Systems', 'Computer Science', 1, 3, 1);

INSERT INTO Course (name, major, is_offered, credit_hours, semester)
VALUES ('Theory of Computation', 'Computer Science', 1, 3, 1);

-- Insert into Student_Phone
INSERT INTO Student_Phone (student_id, phone_number)
VALUES (1, '1234567890');

-- Insert into PreqCourse_course
INSERT INTO PreqCourse_course (prerequisite_course_id, course_id)
VALUES (1, 2);

-- Insert into Instructor
INSERT INTO Instructor (instructor_id, name, email, faculty, office)
VALUES (1, 'Instructor Name', 'instructor@example.com', 'Engineering', 'Office 2');

-- Insert into Instructor_Course
INSERT INTO Instructor_Course (course_id, instructor_id)
VALUES (1, 1);

-- Insert into Student_Instructor_Course_Take
INSERT INTO Student_Instructor_Course_Take (student_id, course_id, instructor_id, semester_code, exam_type, grade)
VALUES (1, 1, 1, '2021 Fall', 'Normal', 2.20);

-- Insert into Semester
INSERT INTO Semester (semester_code, start_date, end_date)
VALUES ('2021 Fall', '2021-09-01', '2021-12-31');

-- Insert into Course_Semester
INSERT INTO Course_Semester (course_id, semester_code)
VALUES (1, '2021 Fall');

-- Insert into Slot
INSERT INTO Slot (slot_id, day, time, location, course_id, instructor_id)
VALUES (1, 'Monday', 1, 'Room 101', 1, 1);

-- Insert into Graduation_plan
INSERT INTO Graduation_plan (plan_id, semester_code, semester_credit_hours, expected_grad_date, advisor_id, student_id)
VALUES (1, '2021 Fall', 15, '2024', 1, 1);

-- Insert into GradPlan_Course
INSERT INTO GradPlan_Course (plan_id, semester_code, course_id)
VALUES (1, '2021 Fall', 1);

-- Insert into Request
INSERT INTO Request (type, comment, status, credit_hours, student_id, advisor_id, course_id)
VALUES ('Type 1', 'Comment 1', 'pending', 3, 1, 1, 1);

-- Insert into MakeUp_Exam
INSERT INTO MakeUp_Exam (exam_id, date, type, course_id)
VALUES (1, '2022-01-01', 'Type 1', 1);

-- Insert into Exam_Student
INSERT INTO Exam_Student (exam_id, student_id, course_id)
VALUES (1, 1, 1);

-- Insert into Payment
INSERT INTO Payment (payment_id, amount, deadline, n_installments, status, fund_percentage, student_id, semester_code, start_date)
VALUES (1, 10000.00, '2022-01-01', 2, 'notPaid', 1.00, 1, '2021 Fall', '2021-09-01');

-- Insert into Installment
INSERT INTO Installment (payment_id, deadline, amount, status, start_date)
VALUES (1, '2022-01-01', 500.00, 'PAID', '2021-09-01');
