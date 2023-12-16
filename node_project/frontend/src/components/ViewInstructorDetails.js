import React, { useState, useEffect } from 'react'
import api from '../services/api'
import DisplayTable from './DisplayTable'

const ViewInstructorDetails = () => {
  const [instructorDetails, setInstructorDetails] = useState(null)

  useEffect(() => {
    api.viewInstuctorDetails().then((res) => {
      setInstructorDetails(res.data)
    })
  }, [])

  return <DisplayTable data={instructorDetails} />
}

export default ViewInstructorDetails
