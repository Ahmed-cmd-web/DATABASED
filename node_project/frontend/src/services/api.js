import axios from 'axios'

const api = axios.create({
  baseURL: process.env.REACT_APP_BACKEND_URL,
})

const getGraduationPlan = async (id) => await api.get(`/graduation-plan/${id}`)

const getUpcomingUnpaidInstallment = async (id) =>
  await api.get(`/unpaid-installment/${id}`)

const getAllCoursesExams = async () => await api.get(`/all-courses-exams/`)

const getCourseSlotsInstructors = async () =>
  await api.get(`/courses-slots-instructors/`)

const getSlotsOfCourseGivenInstructor = async (id, instructorId) =>
  await api.get(`/slots-of-course-given-instructor/${id}/${instructorId}`)

const getCourseWithPrerequisites = async () =>
  await api.get(`/courses-with-prerequisites/`)

const getInstructorsAlongWithTheirCourses = async () =>
  await api.get(`/instructors-along-with-their-courses/`)

const getStudentCourses = async (id) => await api.get(`/student-courses/${id}`)

const getInstructorCourses = async (course_id) =>
  await api.get(`/instructor-courses/${course_id}`)

const chooseInstructor = async (
  student_id,
  semester_code,
  course_id,
  instructor_id
) =>
  await api.post(`/choose-instructor-for-course`, {
    student_id,
    semester_code,
    course_id,
    instructor_id,
  })
const getSemester = async () => await api.get(`/get-current-semester`)

const registerFirstExam = async (student_id, course_id, semester_code) =>
  await api.post(`/first-makeup-exam`, { student_id, course_id, semester_code })

const listAdvisors = async () => await api.get(`/list-advisors`)

const fetchSemestersCourses = async () =>
  await api.get(`/fetch-semesters-courses/`)

const viewInstuctorDetails = async () =>
  await api.get(`/view-instructor-details/`)

const enrollStudentInCourse = async (
  student_id,
  course_id,
  semester_code,
  instructor_id
) =>
  await api.post(`/enroll-student-course`, {
    student_id,
    course_id,
    semester_code,
    instructor_id,
  })

const addCourse = async (major, semester, credit_hours, name, is_offered) =>
  await api.post(`/add-course`, {
    major,
    semester,
    credit_hours,
    name,
    is_offered,
  })

const addSemester = async (start_date, end_date, semester_code) =>
  await api.post(`/add-semester`, { start_date, end_date, semester_code })

const listPendingRequests = async () => await api.get(`/list-pending-requests`)

const listStudentsAdvisors = async () =>
  await api.get(`/list-students-advisors`)

const linkStudentToAdvisor = async (student_id, advisor_id) =>
  await api.post('/link-student-advisor', { student_id, advisor_id })

const linkInstructorToCourse = async (instructor_id, course_id, slot_id) =>
  await api.post('/link-instructor-course', {
    instructor_id,
    course_id,
    slot_id,
  })

export default {
  getGraduationPlan,
  getUpcomingUnpaidInstallment,
  getAllCoursesExams,
  getCourseSlotsInstructors,
  getSlotsOfCourseGivenInstructor,
  getCourseWithPrerequisites,
  getInstructorsAlongWithTheirCourses,
  getStudentCourses,
  getInstructorCourses,
  chooseInstructor,
  getSemester,
  registerFirstExam,
  listAdvisors,
  fetchSemestersCourses,
  viewInstuctorDetails,
  enrollStudentInCourse,
  addCourse,
  addSemester,
  listPendingRequests,
  listStudentsAdvisors,
  linkStudentToAdvisor,
  linkInstructorToCourse,
}
