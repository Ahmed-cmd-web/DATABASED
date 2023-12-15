import './index.css'
import { useEffect } from 'react'
import { useState } from 'react'
import api from '../../services/api'
import DisplayData from '../DisplayTable/index'
import { Button, Select } from 'antd'
import notify from '../../services/notification'

const SlotOfCourseGivenInstructor = () => {
  const [courseId, setCourseId] = useState(null)
  const [instructorId, setInstructorId] = useState(null)
  const [courseAndInstructors, setCourseAndInstructors] = useState([])
  const [data, setData] = useState([])

  useEffect(() => {
    api.getInstructorsAlongWithTheirCourses().then(({ data }) => {
      setCourseAndInstructors(data)
    })
  }, [])

  return (
    <div className='SlotOfCourseGivenInstructor'>
      <div className='selects'>
        <Select
          placeholder='Select Course'
          size='large'
          options={courseAndInstructors.map((e) => ({
            label: e.Course,
            value: e.course_id,
          }))}
          onChange={(e) => setCourseId(e)}
        />
        <Select
          placeholder='Select Instructor'
          size='large'
          options={courseAndInstructors.map((e) => ({
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
          api
            .getSlotsOfCourseGivenInstructor(courseId, instructorId)
            .then(({ data }) => {
              setData(data)
              if (!data || !data.length)
                notify({
                  message: 'Not Found',
                  desc: 'No Slots Found for the given Course and Instructor',
                  type: 'error',
                })
            })
            .catch((e) => console.log(e))
        }}
      >
        {!(courseId && instructorId)
          ? 'Select Course And Instructor first'
          : 'Search'}
      </Button>
      {data && <DisplayData data={data} />}
    </div>
  )
}

export default SlotOfCourseGivenInstructor
