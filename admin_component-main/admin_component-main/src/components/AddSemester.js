import React, { useState } from 'react';

const AddSemester = () => {
  const [semesterName, setSemesterName] = useState('');

  const handleSubmit = (e) => {
    e.preventDefault();
    // Here, you would typically send a request to your API to add the semester
    console.log('Adding semester:', semesterName);
    // Add API call logic here...
  };

  return (
    <div>
      <h2>Add New Semester</h2>
      <form onSubmit={handleSubmit}>
        <div>
          <label>Semester Name:</label>
          <input
            type="text"
            value={semesterName}
            onChange={(e) => setSemesterName(e.target.value)}
          />
        </div>
        <button type="submit">Add Semester</button>
      </form>
    </div>
  );
};

export default AddSemester;