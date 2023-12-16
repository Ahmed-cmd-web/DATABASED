import React, { useState, useEffect } from 'react'
import api from '../services/api'
import DisplayTable from './DisplayTable'

const ListPendingRequests = () => {
  const [pendingRequests, setPendingRequests] = useState([])

  useEffect(() => {
    api.listPendingRequests().then((res) => {
      setPendingRequests(res.data)
    })
  }, [])

  return <DisplayTable data={pendingRequests} />
}

export default ListPendingRequests
