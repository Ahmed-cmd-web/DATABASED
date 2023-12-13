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
]
