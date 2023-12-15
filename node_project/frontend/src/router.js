import { createBrowserRouter } from 'react-router-dom'
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

const router = createBrowserRouter([
  {
    element: <App />,
    children: [
      { path: '/*', element: <Menu />, },
      { path: 'graduation-plan/', element: <GraduationPlan /> },
      { path: 'unpaid-installment/', element: <UnpaidInstallment /> },
      { path: 'all-courses-exams/', element: <AllCourseExam /> },
      { path: 'courses-slots-instructors/', element: <CourseSlotInstructor /> },
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
    ],
  },
])

export default router
