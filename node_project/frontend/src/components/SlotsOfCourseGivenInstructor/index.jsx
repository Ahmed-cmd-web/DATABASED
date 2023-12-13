import { useEffect } from 'react'
import { useState } from 'react'
import { useParams } from 'react-router-dom'
import api from '../../api'
import DisplayData from '../DisplayTable/index'

const SlotOfCourseGivenInstructor = () => {
  const { studentId, instructorId } = useParams()

  const [data, setData] = useState([])
  useEffect(() => {
    api
      .getSlotsOfCourseGivenInstructor(studentId, instructorId)
      .then(({ data }) => setData(data))
      .catch((e) => console.log(e))
  }, [])

  return <DisplayData data={data} />
}

export default SlotOfCourseGivenInstructor
