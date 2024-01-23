import React, { useState, useEffect } from 'react';

const ListStudentsAdvisors = () => {
  const [studentAdvisorPairs, setStudentAdvisorPairs] = useState([]);

  useEffect(() => {
    fetch('/api/students-advisors')
      .then(response => response.json())
      .then(data => setStudentAdvisorPairs(data))
      .catch(error => console.error('Error fetching data: ', error));
  }, []);

  return (
    <div>
      <h2>Students and Their Advisors</h2>
      <ul>
        {studentAdvisorPairs.map(pair => (
          <li key={pair.student.id}>
            {pair.student.name} - Advisor: {pair.advisor.name}
          </li>
        ))}
      </ul>
    </div>
  );
};

export default ListStudentsAdvisors;