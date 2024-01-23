import React from 'react';
import { BrowserRouter as Router, Routes, Route, Link } from 'react-router-dom';


// Style for the links to make them look like buttons
const linkStyle = {
  margin: '5px',
  textDecoration: 'none',
  padding: '10px 15px',
  border: 'none',
  backgroundColor: '#007bff',
  color: 'white',
  borderRadius: '5px',
  display: 'inline-block',
  fontSize: '16px',
  cursor: 'pointer'
};

const AdminComponent = () => {
  return (
      <div>
        {/* Navigation links with styling */}
        <nav>
          <Link to="/list-advisors" style={linkStyle}>List Advisors</Link>
          <Link to="/list-students-advisors" style={linkStyle}>List Students Advisors</Link>
          <Link to="/list-pending-requests" style={linkStyle}>List Pending Requests</Link>
          <Link to="/add-semester" style={linkStyle}>Add Semester</Link>
          <Link to="/add-course" style={linkStyle}>Add Course</Link>
          <Link to="/link-instructor-course" style={linkStyle}>Link Instructor To Course</Link>
          <Link to="/link-student-advisor" style={linkStyle}>Link Student To Advisor</Link>
          <Link to="/enroll-student-course" style={linkStyle}>Enroll Student In Course</Link>
          <Link to="/view-instructor-details" style={linkStyle}>View Instructor Details</Link>
          <Link to="/fetch-semesters-courses" style={linkStyle}>Fetch Semesters Courses</Link>
          {/* Add other navigation links here */}
        </nav>
      </div>
  );
};

export default AdminComponent;


