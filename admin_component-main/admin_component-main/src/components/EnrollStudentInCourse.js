import React, { useState, useEffect } from 'react';

const EnrollStudentInCourse = () => {
  const [students, setStudents] = useState([]);
  const [courses, setCourses] = useState([]);
  const [instructors, setInstructors] = useState([]);
  const [selectedStudent, setSelectedStudent] = useState('');
  const [selectedCourse, setSelectedCourse] = useState('');
  const [selectedInstructor, setSelectedInstructor] = useState('');

  useEffect(() => {
    // Fetch students, courses, and instructors data
    // Replace with actual API calls
    setStudents([{ id: 's1', name: 'Student 1' }, /* ...other students */]);
    setCourses([{ id: 'c1', name: 'Course 1' }, /* ...other courses */]);
    setInstructors([{ id: 'i1', name: 'Instructor 1' }, /* ...other instructors */]);
  }, []);

  const handleSubmit = (e) => {
    e.preventDefault();
    // Here, you would typically send a request to your API to enroll the student
    console.log(`Enrolling Student: ${selectedStudent} in Course: ${selectedCourse} with Instructor: ${selectedInstructor}`);
    // Add API call logic here...
  };

  return (
    <div>
      <h2>Enroll Student in Course</h2>
      <form onSubmit={handleSubmit}>
        <div>
          <label>Student:</label>
          <select value={selectedStudent} onChange={(e) => setSelectedStudent(e.target.value)}>
            {students.map(student => (
              <option key={student.id} value={student.id}>{student.name}</option>
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
        <div>
          <label>Instructor:</label>
          <select value={selectedInstructor} onChange={(e) => setSelectedInstructor(e.target.value)}>
            {instructors.map(instructor => (
              <option key={instructor.id} value={instructor.id}>{instructor.name}</option>
            ))}
          </select>
        </div>
        <button type="submit">Enroll</button>
      </form>
    </div>
  );
};

export default EnrollStudentInCourse;