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

const getInstructorsAlongWithTheirCourses = async () => await api.get(`/instructors-along-with-their-courses/`)

export default {
  getGraduationPlan,
  getUpcomingUnpaidInstallment,
  getAllCoursesExams,
  getCourseSlotsInstructors,
  getSlotsOfCourseGivenInstructor,
  getCourseWithPrerequisites,
  getInstructorsAlongWithTheirCourses
}
