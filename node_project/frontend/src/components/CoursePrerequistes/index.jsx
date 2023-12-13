import { useEffect } from 'react'
import { useState } from 'react'
import api from '../../api'
import DisplayData from '../DisplayTable/index'

const CoursePrerequisites = () => {
  const [data, setData] = useState([])
  useEffect(() => {
    api
      .getCourseWithPrerequisites()
      .then(({ data }) => setData(data))
      .catch((e) => console.log(e))
  }, [])

  return <DisplayData data={data} />
}

export default CoursePrerequisites
