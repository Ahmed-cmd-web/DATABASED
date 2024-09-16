import React, { useState, useEffect } from 'react'
import api from '../services/api'

const LinkInstructorToCourse = () => {
  const [selectedInstructor, setSelectedInstructor] = useState('')
  const [selectedCourse, setSelectedCourse] = useState('')
  const [selectedSlot, setSelectedSlot] = useState('')

  const handleSubmit = (e) => {
    e.preventDefault()
    api
      .linkInstructorToCourse(selectedInstructor, selectedCourse, selectedSlot)
      .then((res) => console.log(res.data))
      .catch((err) => console.log(err))
  }

  return (
    <div>
      <h2>Link Instructor to Course</h2>
      <form onSubmit={handleSubmit}>
        <div>
          <label>Instructor ID:</label>
          <input
            type='number'
            value={selectedInstructor}
            onChange={(e) => setSelectedInstructor(e.target.value)}
          />
        </div>
        <div>
          <label> Course ID:</label>
          <input
            type='number'
            value={selectedCourse}
            onChange={(e) => setSelectedCourse(e.target.value)}
          />
        </div>
        <div>
          <label> Slot ID:</label>
          <input
            type='number'
            value={selectedSlot}
            onChange={(e) => setSelectedSlot(e.target.value)}
          />
        </div>
        <button type='submit'>Link</button>
      </form>
    </div>
  )
}

export default LinkInstructorToCourse
