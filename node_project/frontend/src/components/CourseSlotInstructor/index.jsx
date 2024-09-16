import { useEffect } from 'react'
import { useState } from 'react'
import api from '../../services/api'
import DisplayData from '../DisplayTable/index'

const CourseSlotInstructor = () => {
  const [data, setData] = useState([])
  useEffect(() => {
    api
      .getCourseSlotsInstructors()
      .then(({ data }) => setData(data))
      .catch((e) => console.log(e))
  }, [])

  return <DisplayData data={data} />
}

export default CourseSlotInstructor
