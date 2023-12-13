import { useEffect } from 'react'
import { useState } from 'react'
import { useParams } from 'react-router-dom'
import api from '../../api'
import DisplayData from '../DisplayTable/index'

const UnpaidInstallment = () => {
  const { studentId } = useParams()
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
