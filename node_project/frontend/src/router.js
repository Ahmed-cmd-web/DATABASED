import { createBrowserRouter } from 'react-router-dom'
import App from './App'
import Menu from './components/Menu'
import GraduationPlan from './components/GraduationPlan'
import UnpaidInstallment from './components/UnpaidInstallment'
import AllCourseExam from './components/AllCourseExam'
import CourseSlotInstructor from './components/CourseSlotInstructor'
import SlotOfCourseGivenInstructor from './components/SlotsOfCourseGivenInstructor'
import CoursePrerequisites from './components/CoursePrerequistes'

const router = createBrowserRouter([
  {
    element: <App />,
    children: [
      { path: '/*', element: <Menu /> },
      { path: 'graduation-plan/:studentId', element: <GraduationPlan /> },
      { path: 'unpaid-installment/:studentId', element: <UnpaidInstallment /> },
      { path: 'all-courses-exams/', element: <AllCourseExam /> },
      { path: 'courses-slots-instructors/', element: <CourseSlotInstructor /> },
      {
        path: 'slots-of-course-given-instructor/:studentId/:instructorId',
        element: <SlotOfCourseGivenInstructor />,
      },
      {
        path: 'courses-with-prerequisites/',
        element: <CoursePrerequisites />,
      },
    ],
  },
])

export default router
