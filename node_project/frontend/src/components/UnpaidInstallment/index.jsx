import { useEffect } from 'react'
import { useState } from 'react'
import api from '../../services/api'
import DisplayData from '../DisplayTable/index'

const UnpaidInstallment = () => {
  const studentId = localStorage.getItem('student_id')
  const [data, setData] = useState([])
  useEffect(() => {
    api
      .getUpcomingUnpaidInstallment(studentId)
      .then(({ data }) => setData(data))
      .catch((e) => console.log(e))
  }, [])

  return <DisplayData data={data} />
}

export default UnpaidInstallment
