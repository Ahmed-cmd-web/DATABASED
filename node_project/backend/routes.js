module.exports = [
  {
    path: '/graduation-plan/:id',
    query: ({ id }) => `SELECT  * from dbo.FN_StudentViewGP(${id})`,
    type: 'get',
  },
  {
    path: '/unpaid-installment/:id',
    query: ({ id }) =>
      `SELECT dbo.FN_StudentUpcoming_installment(${id}) AS Deadline`,
    type: 'get',
  },
  {
    path: '/all-courses-exams',
    query: (_) => `SELECT * FROM Courses_MakeupExams`,
    type: 'get',
  },
  {
    path: '/courses-slots-instructors',
    query: (_) => `SELECT * FROM Courses_Slots_Instructor`,
    type: 'get',
  },
  {
    path: '/courses-slots-instructors',
    query: (_) => `SELECT * FROM Courses_Slots_Instructor`,
    type: 'get',
  },
  {
    path: '/slots-of-course-given-instructor/:id/:instructorId',
    query: ({ id, instructorId }) =>
      `SELECT * FROM dbo.FN_StudentViewSlot(${id}, ${instructorId})`,
    type: 'get',
  },
  {
    path: '/courses-with-prerequisites',
    query: (_) => `SELECT * FROM view_Course_prerequisites`,
    type: 'get',
  },
  {
    path: '/instructors-along-with-their-courses',
    query: (_) => 'SELECT * FROM Instructors_AssignedCourses',
    type: 'get',
  },
  {
    path: '/student-courses/:id',
    query: ({
      id,
    }) => `SELECT sict.course_id,c.name,sict.semester_code FROM Student_Instructor_Course_take sict,Course c
            WHERE student_id = ${id} AND sict.course_id = c.course_id`,
    type: 'get',
  },
  {
    path: '/instructor-courses/:course_id',
    query: ({ course_id }) =>
      `SELECT * FROM Instructors_AssignedCourses WHERE course_id=${course_id}`,
    type: 'get',
  },
  {
    path: '/get-current-semester',
    query: (_) =>
      `SELECT * FROM Semester WHERE GETDATE() BETWEEN start_date AND end_date`,
    type: 'get',
  },
  {
    path: '/choose-instructor-for-course',
    query: (_) => '',
    extraAction: ({ student_id, semester_code, course_id, instructor_id }) =>
      `SELECT * FROM Procedures_ChooseInstructor
            @StudentID=${student_id},@current_semester_code=${semester_code},
            @CourseID=${course_id},@instrucorID=${instructor_id}`,
    type: 'post',
  },
  {
    path: '/first-makeup-exam',
    query: (_) => '',
    extraAction: ({ student_id, semester_code, course_id }) =>
      `SELECT * FROM Procedures_StudentRegisterFirstMakeup
            @StudentID=${student_id},@studentCurr_sem=${semester_code},
            @CourseID=${course_id}`,
    type: 'post',
  },
  {
    path: '/second-makeup-exam',
    query: (_) => '',
    extraAction: ({ student_id, semester_code, course_id }) =>
      `SELECT * FROM Procedures_StudentRegisterSecondMakeup
            @StudentID=${student_id},@studentCurr_sem=${semester_code},
            @CourseID=${course_id}`,
    type: 'post',
  },
]
