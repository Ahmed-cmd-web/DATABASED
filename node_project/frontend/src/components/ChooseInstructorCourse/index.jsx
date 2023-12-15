import { useEffect,useState } from 'react'
import api from '../../services/api'
import { Button, Select } from 'antd'
import notify from '../../services/notification'

const ChooseInstructorCourse = () => {
  const student_id = localStorage.getItem('student_id')
  const [courseId, setCourseId] = useState(null)
  const [instructorId, setInstructorId] = useState(null)
  const [courses, setCourses] = useState([])
  const [instructors, setInstructors] = useState([])

  useEffect(() => {
    api.getStudentCourses(student_id).then(({ data }) => setCourses(data))
  }, [])
  return (
    <div className='SlotOfCourseGivenInstructor'>
      <div className='selects'>
        <Select
          placeholder='Select Course'
          size='large'
          options={courses?.map((e) => ({
            label: e.name,
            value: e.course_id,
          }))}
          onChange={(e) => {
            setCourseId(e)
            setInstructorId(null)
            api.getInstructorCourses(e).then(({ data }) => setInstructors(data))
          }}
        />
        <Select
          disabled={!courseId}
          placeholder='Select Instructor'
          size='large'
          options={instructors.map((e) => ({
            label: e.Instructor,
            value: e.instructor_id,
          }))}
          onChange={(e) => setInstructorId(e)}
        />
      </div>
      <Button
        type='primary'
        className='search'
        size='large'
        disabled={!(courseId && instructorId)}
        style={{ marginTop: '1rem', width: '40%' }}
        onClick={() => {
          let semester = courses.find(
            (e) => e.course_id === courseId
          ).semester_code
          api
            .chooseInstructor(student_id, semester, courseId, instructorId)
            .then((res) => {
              if (res.status === 200)
                notify({
                  message: 'Success',
                  desc: 'Instructor Assigned Successfully',
                  type: 'success',
                })
            })
            .catch((e) => {
              console.log(e)
              notify({
                message: 'Error',
                desc: 'Instructor Assignment Failed',
                type: 'error',
              })
            })
        }}
      >
        {!(courseId && instructorId)
          ? 'Select Course And Instructor first'
          : 'Assign Instructor'}
      </Button>
    </div>
  )
}

export default ChooseInstructorCourse
