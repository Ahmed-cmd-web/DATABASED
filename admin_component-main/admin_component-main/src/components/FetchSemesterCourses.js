import React, { useState, useEffect } from 'react';

const FetchSemestersCourses = () => {
  const [semesters, setSemesters] = useState([]);

  useEffect(() => {
    // Fetch semesters and courses
    // Replace with actual API calls
    // Example: setSemesters(fetchedSemesters);
  }, []);

  return (
    <div>
      <h2>Semesters and Courses</h2>
      {semesters.map(semester => (
        <div key={semester.id}>
          <h3>{semester.name}</h3>
          <ul>
            {semester.courses.map(course => (
              <li key={course.id}>{course.name}</li>
            ))}
          </ul>
        </div>
      ))}
    </div>
  );
};

export default FetchSemestersCourses;