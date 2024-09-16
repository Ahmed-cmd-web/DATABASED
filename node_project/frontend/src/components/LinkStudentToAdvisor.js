import React, { useState, useEffect } from 'react'
import api from '../services/api'

const LinkStudentToAdvisor = () => {
  const [selectedStudent, setSelectedStudent] = useState('')
  const [selectedAdvisor, setSelectedAdvisor] = useState('')

  const handleSubmit = (e) => {
    e.preventDefault()
    api
      .linkStudentToAdvisor(selectedStudent, selectedAdvisor)
      .then((res) => console.log(res.data))
      .catch((err) => console.log(err))
  }

  return (
    <div>
      <h2>Link Student to Advisor</h2>
      <form onSubmit={handleSubmit}>
        <div>
          <label> Student:</label>
          <input
            type='number'
            value={selectedStudent}
            onChange={(e) => setSelectedStudent(e.target.value)}
          />
        </div>
        <div>
          <label>Advisor:</label>
          <input
            type='number'
            value={selectedAdvisor}
            onChange={(e) => setSelectedAdvisor(e.target.value)}
          />
        </div>
        <button type='submit'>Link</button>
      </form>
    </div>
  )
}

export default LinkStudentToAdvisor
