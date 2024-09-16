import React, { useState, useEffect } from 'react'
import api from '../services/api'
import DisplayTable from './DisplayTable'

const ListStudentsAdvisors = () => {
  const [studentAdvisorPairs, setStudentAdvisorPairs] = useState([])

  useEffect(() => {
    api.listStudentsAdvisors().then((res) => {
      setStudentAdvisorPairs(res.data)
    })
  }, [])

  return <DisplayTable data={studentAdvisorPairs} />
}

export default ListStudentsAdvisors
