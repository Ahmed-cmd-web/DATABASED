import React, { useState, useEffect } from 'react';

const LinkInstructorToCourse = () => {
  const [instructors, setInstructors] = useState([]);
  const [courses, setCourses] = useState([]);
  const [selectedInstructor, setSelectedInstructor] = useState('');
  const [selectedCourse, setSelectedCourse] = useState('');

  useEffect(() => {
    // Fetch instructors and courses data
    // Replace with actual API calls
    setInstructors([{ id: '1', name: 'Instructor 1' }, /* ...other instructors */]);
    setCourses([{ id: '101', name: 'Course 101' }, /* ...other courses */]);
  }, []);

  const handleSubmit = (e) => {
    e.preventDefault();
    // Here, you would typically send a request to your API to link the instructor to the course
    console.log('Linking Instructor:', selectedInstructor, 'to Course:', selectedCourse);
    // Add API call logic here...
  };

  return (
    <div>
      <h2>Link Instructor to Course</h2>
      <form onSubmit={handleSubmit}>
        <div>
          <label>Instructor:</label>
          <select value={selectedInstructor} onChange={(e) => setSelectedInstructor(e.target.value)}>
            {instructors.map(instructor => (
              <option key={instructor.id} value={instructor.id}>{instructor.name}</option>
            ))}
          </select>
        </div>
        <div>
          <label>Course:</label>
          <select value={selectedCourse} onChange={(e) => setSelectedCourse(e.target.value)}>
            {courses.map(course => (
              <option key={course.id} value={course.id}>{course.name}</option>
            ))}
          </select>
        </div>
        <button type="submit">Link</button>
      </form>
    </div>
  );
};

export default LinkInstructorToCourse;