import { useState, useEffect } from 'react'
import api from '../../services/api'
import { Button, Select } from 'antd'
import notify from '../../services/notification'

const RegisterSecondMakeUp = () => {
  const student_id = localStorage.getItem('student_id')
  const [courses, setCourses] = useState(null)
  const [courseId, setCourseId] = useState(null)
  const [currentSemester, setCurrentSemester] = useState(null)
  useEffect(() => {
    api.getStudentCourses(student_id).then(({ data }) => setCourses(data))
  }, [])
  return (
    <div className='RegisterMakeUp'>
      <Select
        placeholder='Select Course'
        size='large'
        options={courses?.map((e) => ({
          label: e.name,
          value: e.course_id,
        }))}
        onChange={setCourseId}
      />

      <Button
        type='primary'
        className='search'
        size='large'
        disabled={!courseId}
        style={{ marginTop: '1rem', width: '40%' }}
        onClick={() => {
          if (!currentSemester)
            api
              .getSemester()
              .then(({ data }) =>
                setCurrentSemester(data.length > 0 && data[0].semester_code)
              )
          api
            .registerFirstExam(student_id, courseId, currentSemester)
            .then((res) => {
              if (res.status === 200)
                notify({
                  message: 'Success',
                  desc: 'Registered Successfully!',
                  type: 'success',
                })
            })
            .catch((e) => {
              console.log(e)
              notify({
                message: 'Error',
                desc: 'Registration Failed!',
                type: 'error',
              })
            })
        }}
      >
        {!courseId ? 'Select Course First' : 'Register For Make Up Exam'}
      </Button>
    </div>
  )
}

export default RegisterSecondMakeUp
