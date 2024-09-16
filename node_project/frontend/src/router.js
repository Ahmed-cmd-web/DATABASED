import { createBrowserRouter, Outlet } from 'react-router-dom'
import App from './App'
import Menu from './components/Menu'
import GraduationPlan from './components/GraduationPlan'
import UnpaidInstallment from './components/UnpaidInstallment'
import AllCourseExam from './components/AllCourseExam'
import CourseSlotInstructor from './components/CourseSlotInstructor'
import SlotOfCourseGivenInstructor from './components/SlotsOfCourseGivenInstructor'
import CoursePrerequisites from './components/CoursePrerequistes'
import ChooseInstructorCourse from './components/ChooseInstructorCourse'
import RegisterFirstMakeUp from './components/RegisterFirstMakeUp'
import RegisterSecondMakeUp from './components/RegisterSecondMakeUp'
import AdminLogin from './components/AdminLogin'
import AdminComponent from './components/AdminComponent'
import ListAdvisor from './components/ListAdvisor'
import ListStudentsAdvisors from './components/ListStudentsAdvisor'
import ListPendingRequest from './components/ListPendingRequest'
import AddSemester from './components/AddSemester'
import AddCourse from './components/AddCourse'
import LinkInstructorToCourse from './components/LinkInstructorToCourse'
import LinkStudentToAdvisor from './components/LinkStudentToAdvisor'
import EnrollStudentInCourse from './components/EnrollStudentInCourse'
import ViewInstructorDetails from './components/ViewInstructorDetails'
import FetchSemesterCourses from './components/FetchSemesterCourses'

const router = createBrowserRouter([
  {
    element: <App />,
    children: [
      {
        path: '/student/*',
        element: <Outlet />,
        children: [
          { path: 'graduation-plan/', element: <GraduationPlan /> },
          { path: 'unpaid-installment/', element: <UnpaidInstallment /> },
          { path: 'all-courses-exams/', element: <AllCourseExam /> },
          {
            path: 'courses-slots-instructors/',
            element: <CourseSlotInstructor />,
          },
          { path: 'first-makeup-exam/', element: <RegisterFirstMakeUp /> },
          { path: 'second-makeup-exam/', element: <RegisterSecondMakeUp /> },
          {
            path: 'slots-of-course-given-instructor/',
            element: <SlotOfCourseGivenInstructor />,
          },
          {
            path: 'courses-with-prerequisites/',
            element: <CoursePrerequisites />,
          },
          {
            path: 'choose-instructor-for-course/',
            element: <ChooseInstructorCourse />,
          },
          { path: 'menu', element: <Menu /> },
        ],
      },
      {
        path: '/adminPart1/*',
        children: [
          {
            path: 'login/',
            element: <AdminLogin />,
          },
          {
            path: 'dashboard/',
            element: <AdminComponent />,
          },
          {
            path: 'list-advisors/',
            element: <ListAdvisor />,
          },
          {
            path: 'list-students-advisors/',
            element: <ListStudentsAdvisors />,
          },
          {
            path: 'list-pending-requests/',
            element: <ListPendingRequest />,
          },
          {
            path: 'add-semester/',
            element: <AddSemester />,
          },
          {
            path: 'add-course/',
            element: <AddCourse />,
          },
          {
            path: 'link-instructor-course/',
            element: <LinkInstructorToCourse />,
          },
          {
            path: 'link-student-advisor/',
            element: <LinkStudentToAdvisor />,
          },
          {
            path: 'enroll-student-course/',
            element: <EnrollStudentInCourse />,
          },
          {
            path: 'view-instructor-details/',
            element: <ViewInstructorDetails />,
          },
          {
            path: 'fetch-semesters-courses/',
            element: <FetchSemesterCourses />,
          },
        ],
      },
    ],
  },
])

export default router
