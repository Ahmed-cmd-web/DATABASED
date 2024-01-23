import React, { useState, useEffect } from 'react';

const ViewInstructorDetails = ({ instructorId }) => {
  const [instructorDetails, setInstructorDetails] = useState(null);
  const [courses, setCourses] = useState([]);

  useEffect(() => {
    // Fetch instructor details and courses
    // Replace with actual API calls
    // Example:
    // setInstructorDetails(fetchedInstructorDetails);
    // setCourses(fetchedCourses);
  }, [instructorId]);

  if (!instructorDetails) {
    return <div>Loading...</div>;
  }

  return (
    <div>
      <h2>Instructor Details</h2>
      <p>Name: {instructorDetails.name}</p>
      <h3>Assigned Courses</h3>
      <ul>
        {courses.map(course => (
          <li key={course.id}>{course.name}</li>
        ))}
      </ul>
    </div>
  );
};

export default ViewInstructorDetails;