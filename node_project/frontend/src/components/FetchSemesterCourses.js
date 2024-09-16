import React, { useState, useEffect } from 'react'
import api from '../services/api'
import DisplayTable from './DisplayTable'

const FetchSemestersCourses = () => {
  const [semesters, setSemesters] = useState([])

  useEffect(() => {
    api.fetchSemestersCourses().then((res) => {
      setSemesters(res.data)
    })
  }, [])

  return <DisplayTable data={semesters} />
}

export default FetchSemestersCourses
