import React, { useState, useEffect } from 'react'
import api from '../services/api'

const EnrollStudentInCourse = () => {
  const [selectedStudent, setSelectedStudent] = useState('')
  const [selectedCourse, setSelectedCourse] = useState('')
  const [selectedInstructor, setSelectedInstructor] = useState('')

  const handleSubmit = (e) => {
    e.preventDefault()
    api
      .enrollStudentInCourse(
        selectedStudent,
        selectedCourse,
        selectedInstructor
      )
      .then((res) => console.log(res.data))
  }

  return (
    <div>
      <h2>Enroll Student in Course</h2>
      <form onSubmit={handleSubmit}>
        <div>
          <label>Student:</label>
          <input
            type='number'
            value={selectedStudent}
            onChange={(e) => setSelectedStudent(e.target.value)}
          />
        </div>
        <div>
          <label>Course:</label>
          <input
            type='number'
            value={selectedCourse}
            onChange={(e) => setSelectedCourse(e.target.value)}
          />
        </div>
        <div>
          <label>Instructor:</label>
          <input
            type='number'
            value={selectedInstructor}
            onChange={(e) => setSelectedInstructor(e.target.value)}
          />
        </div>
        <button type='submit'>Enroll</button>
      </form>
    </div>
  )
}

export default EnrollStudentInCourse
