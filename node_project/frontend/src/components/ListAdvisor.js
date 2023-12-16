import React, { useState, useEffect } from 'react'
import api from '../services/api'
import DisplayData from './DisplayTable/index'

const ListAdvisors = () => {
  const [advisors, setAdvisors] = useState([])

  useEffect(() => {
    api.listAdvisors().then((res) => {
      setAdvisors(res.data)
    })
  }, [])

  return <DisplayData data={advisors} />
}

export default ListAdvisors
