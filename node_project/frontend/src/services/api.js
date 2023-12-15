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
}
