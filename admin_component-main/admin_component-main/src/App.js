import AdminLogin from './components/AdminLogin';
import AdminComponent from './components/AdminComponent';
import React from 'react';
import { BrowserRouter as Router, Routes, Route } from 'react-router-dom';
import ListAdvisor from './components/ListAdvisor';
import ListStudentsAdvisors from './components/ListStudentsAdvisor';
import ListPendingRequest from './components/ListPendingRequest';
import AddSemester from './components/AddSemester';
import AddCourse from './components/AddCourse';
import LinkInstructorToCourse from './components/LinkInstructorToCourse';
import LinkStudentToAdvisor from './components/LinkStudentToAdvisor';
import EnrollStudentInCourse from './components/EnrollStudentInCourse';
import ViewInstructorDetails from './components/ViewInstructorDetails';
import FetchSemesterCourses from './components/FetchSemesterCourses';
import './App.css';

function App() {
  return (
    <div className="App">
      <header className="App-header">
        <Router>
          <Routes>
            <Route path="/" element={<AdminLogin />} />
            <Route path="/dashboard" element={<AdminComponent />} />
            <Route path="/list-advisors" element={<ListAdvisor />} />
            <Route path="/list-students-advisors" element={<ListStudentsAdvisors />} />
            <Route path="/list-pending-requests" element={<ListPendingRequest />} />
            <Route path="/add-semester" element={<AddSemester />} />
            <Route path="/add-course" element={<AddCourse />} />
            <Route path="/link-instructor-course" element={<LinkInstructorToCourse />} />
            <Route path="/link-student-advisor" element={<LinkStudentToAdvisor />} />
            <Route path="/enroll-student-course" element={<EnrollStudentInCourse />} />
            <Route path="/view-instructor-details" element={<ViewInstructorDetails />} />
            <Route path="/fetch-semesters-courses" element={<FetchSemesterCourses />} />
            {/* Add additional routes as needed */}
          </Routes>
    </Router>
      </header>
    </div>
  );
}

export default App;
