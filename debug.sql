--Use Advising_Team_119

--EXEC DropAllTables

--EXEC CreateAllTables

INSERT INTO Advisor (name, email, office, password)
VALUES ('John Doe', 'johndoe@example.com', 'Office 1', 'password123');

INSERT INTO Student (f_name, l_name, gpa, faculty, email, major, password, financial_status, semester, acquired_hours, assigned_hours, advisor_id)
VALUES ('Marc', 'Bass', 3.5, 'Engineering', 'janedoe@example.com', 'MET', 'password123', 1, 1, 30, 30, 1);

INSERT INTO Course VALUES ('Database 1', 'MET', 1, 6, 5),
						  ('Database 2', 'MET', 1, 6, 6),
						  ('Math 1', 'MET', 1, 8, 1),
						  ('Math 2', 'MET', 1, 8, 2),
						  ('Math 3', 'MET', 1, 8, 3),
						  ('Math 4', 'MET', 1, 4, 4),
						  ('Math 5', 'MET', 1, 4, 5),
						  ('CS 1', 'MET', 1, 8, 1);

INSERT INTO Student_Phone (student_id, phone_number) VALUES (1, '01129069797');

INSERT INTO PreqCourse_course VALUES 
									 (2, 1),
									 (4, 3),
									 (5, 4),
									 (6, 5),
									 (7, 6);
									 
INSERT INTO Instructor VALUES ('Bill Tin', 'instructor@example.com', 'Engineering', 'C7.202');

INSERT INTO Instructor_Course VALUES (1, 1),
									 (2, 1),
									 (3, 1),
									 (4, 1),
									 (5, 1),
									 (6, 1),
									 (7, 1),
									 (8, 1);

INSERT INTO Student_Instructor_Course_Take VALUES (1, 1, 1, 'Winter 2018 à W18', 'Normal', 'A'),
												  (1, 2, 1, 'Spring 2019 à S19', 'Normal', 'F'),
												  (1, 3, 1, 'Winter 2018 à W18', 'Normal', 'C'),
												  (1, 4, 1, 'Spring 2019 à S19', 'Normal', 'A'),
												  (1, 5, 1, 'Winter 2021 à W21', 'Normal', 'B'),
												  (1, 6, 1, 'Spring 2022 à S22', 'Normal', 'D'),
												  (1, 7, 1, 'Winter 2024 à W24', 'Normal', NULL);


INSERT INTO Semester (semester_code, start_date, end_date) VALUES ('Winter 2018 à W18',   '2018-09-01', '2019-1-1'),
																  ('Spring 2019 à S19',   '2019-02-01', '2019-6-30'),
																  ('Summer 2020 à S20R1', '2020-07-01', '2020-7-29'),
																  ('Summer 2020 à S20R2', '2023-08-01', '2023-8-30'),
																  ('Winter 2021 à W21',   '2021-09-17', '2022-1-1'),
																  ('Spring 2022 à S22',   '2022-02-01', '2022-6-30'),
																  ('Summer 2023 à S23R1', '2023-07-01', '2023-7-29'),
																  ('Summer 2023 à S23R2', '2023-08-01', '2023-8-30'),
																  ('Winter 2024 à W24',   '2024-09-01', '2025-1-1');


INSERT INTO Course_Semester VALUES  (1, 'Winter 2018 à W18'),  
									(2, 'Spring 2019 à S19'), 
									(1, 'Winter 2021 à W21'),
									(2, 'Spring 2022 à S22'),
									(1, 'Winter 2024 à W24'),
									
									(3, 'Winter 2018 à W18'), --math1
									(4, 'Spring 2019 à S19'), --math2
									(5, 'Winter 2021 à W21'), --math3
									(6, 'Spring 2022 à S22'), --math4
									(7, 'Winter 2024 à W24'), --math5
									(8, 'Winter 2018 à W18');

INSERT INTO Slot (day, time, location, course_id, instructor_id)
VALUES ('Monday', 1, 'Room 101', 1, 1);

INSERT INTO Graduation_plan (semester_code, semester_credit_hours, expected_grad_date, advisor_id, student_id)
VALUES ('Winter 2018 à W18', 22, '2025-1-1', 1, 1);

INSERT INTO GradPlan_Course (plan_id, semester_code, course_id) VALUES (1, 'Winter 2018 à W18', 1),
																	   (1, 'Winter 2018 à W18', 2),
																	   (1, 'Winter 2018 à W18', 3),
																	   (1, 'Winter 2018 à W18', 4),
																	   (1, 'Winter 2018 à W18', 5),
																	   (1, 'Winter 2018 à W18', 6),
																	   (1, 'Winter 2018 à W18', 7),
																	   (1, 'Winter 2018 à W18', 8);

INSERT INTO Request (type, comment, status, credit_hours, student_id, advisor_id, course_id)
VALUES ('Type 1', 'Comment 1', 'pending', 3, 1, 1, 1);

INSERT INTO MakeUp_Exam (date, type, course_id)
VALUES ('2022-01-01', 'Type 1', 1);

INSERT INTO Exam_Student (exam_id, student_id, course_id)
VALUES (1, 1, 1);

INSERT INTO Payment (amount, deadline, n_installments, status, fund_percentage, student_id, semester_code, start_date)
VALUES (1000.00, '2018-01-01 10:34:23.55', 2, 'Paid', 50.00, 1, 'Winter 2018 à W18', '2018-09-01 10:34:23.55');

INSERT INTO Installment  VALUES (1, '2018-01-01 10:34:23.55', 500.00, 'Paid', '2018-09-01 10:34:23.55'),
								(1, '2018-05-01 10:34:23.55', 500.00, 'Paid', '2018-10-01 10:43:20.22');