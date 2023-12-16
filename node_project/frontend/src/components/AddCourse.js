import React, { useState } from 'react'
import api from '../services/api'

const AddCourse = () => {
  const [courseName, setCourseName] = useState('')
  const [major, setMajor] = useState('')
  const [semester, setSemester] = useState('')
  const [credit_hours, setCredit_hours] = useState('')
  const [isoffered, setIsoffered] = useState(true)
  const handleSubmit = (e) => {
    e.preventDefault()
    api
      .addCourse(major, semester, credit_hours, courseName, 1)
      .then((res) => console.log(res.data))
  }

  return (
    <div>
      <h2>Add New Course</h2>
      <form onSubmit={handleSubmit}>
        <div>
          <label>Course Name:</label>
          <input
            type='text'
            value={courseName}
            onChange={(e) => setCourseName(e.target.value)}
          />
        </div>
        <div>
          <label>Major:</label>
          <input
            type='text'
            value={major}
            onChange={(e) => setMajor(e.target.value)}
          />
        </div>
        <div>
          <label>Semester:</label>
          <input
            type='text'
            value={semester}
            onChange={(e) => setSemester(e.target.value)}
          />
        </div>
        <div>
          <label>Credit Hours:</label>
          <input
            type='number'
            value={credit_hours}
            onChange={(e) => setCredit_hours(e.target.value)}
          />
        </div>
        <div>
          <label>Is Offered:</label>
          <input
            type='text'
            value={isoffered}
            onChange={(e) => setIsoffered(e.target.value)}
          />
        </div>
        <button type='submit'>Add Course</button>
      </form>
    </div>
  )
}

export default AddCourse
