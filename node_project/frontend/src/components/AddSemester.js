import React, { useState } from 'react'
import api from '../services/api'

const AddSemester = () => {
  const [semesterName, setSemesterName] = useState('')
  const [start, setstart] = useState('')
  const [end, setend] = useState('')
  const handleSubmit = (e) => {
    e.preventDefault()
    api
      .addSemester(start, end, semesterName)
      .then((res) => console.log(res.data))
  }

  return (
    <div>
      <h2>Add New Semester</h2>
      <form onSubmit={handleSubmit}>
        <div>
          <label>Semester Name:</label>
          <input
            type='text'
            value={semesterName}
            onChange={(e) => setSemesterName(e.target.value)}
          />
        </div>
        <div>
          <label>start date:</label>
          <input
            type='date'
            value={start}
            onChange={(e) => setstart(e.target.value)}
          />
        </div>
        <div>
          <label>End date:</label>
          <input
            type='date'
            value={end}
            onChange={(e) => setend(e.target.value)}
          />
        </div>
        <button type='submit'>Add Semester</button>
      </form>
    </div>
  )
}

export default AddSemester
