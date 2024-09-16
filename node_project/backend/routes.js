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
  {
    path: '/list-advisors',
    type: 'get',
    query: (_) => `Exec Procedures_AdminListAdvisors`,
  },
  {
    path: '/fetch-semesters-courses',
    type: 'get',
    query: (_) => `SELECT * FROM Semster_offered_Courses`,
  },
  {
    path: '/view-instructor-details',
    query: (_) => `SELECT i.*,c.* FROM Instructors_AssignedCourses i
                    JOIN Course c ON i.course_id = c.course_id`,
    type: 'get',
  },
  {
    path: '/enroll-student-course',
    query: (_) => '',
    extraAction: ({ course_id, instructor_id, student_id, semester_code }) =>
      `EXEC Procedures_AdminLinkStudent @cours_id = ${course_id},@instructor_id = ${instructor_id}, studentID = ${student_id},@semester_code = ${semester_code}`,
    type: 'post',
  },
  {
    path: '/add-course',
    extraAction: ({ major, semester, credit_hours, name, is_offered }) =>
      `EXEC Procedures_AdminAddingCourse
              @major =${major},
              @semester =${semester},
              @credit_hours =${credit_hours},
              @name =${name},
              @is_offered =${is_offered}`,
    type: 'post',
    query: (_) => '',
  },
  {
    path: '/add-semester',
    extraAction: ({ start_date, end_date, semester_code }) =>
      `EXEC AdminAddingSemester
        @start_date =${start_date},
        @end_date =${end_date},
        @semester_code =${semester_code}`,
    query: (_) => '',
    type: 'post',
  },
  {
    path: 'list-pending-requests',
    query: (_) => `SELECT * FROM Pending_Requests`,
    type: 'get',
  },
  {
    path: '/list-students-advisors',
    query: (_) => 'EXEC AdminListStudentsWithAdvisors',
    type: 'get',
  },
  {
    path: '/link-student-advisor',
    query: (_) => '',
    extraAction: ({ student_id, advisor_id }) =>
      `EXEC Procedures_AdminLinkStudentToAdvisor
        studentID =${student_id},
        advisorid =${advisor_id}`,
    type: 'post',
  },
  {
    path: '/link-instructor-course',
    query: (_) => '',
    extraAction: ({ course_id, instructor_id, slot_id }) =>
      `EXEC Procedures_AdminLinkInstructor
        @cours_id =${course_id},
          @instructor_id =${instructor_id},
            @slot_id =${slot_id}`,
    type: 'post',
  },
]
