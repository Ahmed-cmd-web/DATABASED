import React, { useState, useEffect } from 'react';

const LinkStudentToAdvisor = () => {
  const [students, setStudents] = useState([]);
  const [advisors, setAdvisors] = useState([]);
  const [selectedStudent, setSelectedStudent] = useState('');
  const [selectedAdvisor, setSelectedAdvisor] = useState('');

  useEffect(() => {
    // Fetch students and advisors data
    // Replace with actual API calls
    setStudents([{ id: 's1', name: 'Student 1' }, /* ...other students */]);
    setAdvisors([{ id: 'a1', name: 'Advisor 1' }, /* ...other advisors */]);
  }, []);

  const handleSubmit = (e) => {
    e.preventDefault();
    // Here, you would typically send a request to your API to link the student to the advisor
    console.log('Linking Student:', selectedStudent, 'to Advisor:', selectedAdvisor);
    // Add API call logic here...
  };

  return (
    <div>
      <h2>Link Student to Advisor</h2>
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
          <label>Advisor:</label>
          <select value={selectedAdvisor} onChange={(e) => setSelectedAdvisor(e.target.value)}>
            {advisors.map(advisor => (
              <option key={advisor.id} value={advisor.id}>{advisor.name}</option>
            ))}
          </select>
        </div>
        <button type="submit">Link</button>
      </form>
    </div>
  );
};

export default LinkStudentToAdvisor;