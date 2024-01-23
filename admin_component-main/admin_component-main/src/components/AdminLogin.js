import React, { useState } from 'react';
import { useNavigate } from 'react-router-dom';

const AdminLogin = () => {
  const navigate = useNavigate();
  const [adminId, setadminId] = useState('');
  const [password, setPassword] = useState('');
  const [error, setError] = useState('');

  const hardcodedCredentials = {
    adminId: 'admin',
    password: 'admin123',
  };

  const handleSubmit = (e) => {
    e.preventDefault();
    if (adminId === hardcodedCredentials.adminId && password === hardcodedCredentials.password) {
      navigate('/dashboard'); // Redirect to dashboard route
      console.log('Logged in successfully');
      // Redirect logic here...
    } else {
      setError('Invalid credentials');
    }
  };

  return (
    <div>
      <form onSubmit={handleSubmit}>
        <div>
          <label>User ID:</label>
          <input type="text" value={adminId} onChange={(e) => setadminId(e.target.value)} />
        </div>
        <div>
          <label>Password:</label>
          <input type="password" value={password} onChange={(e) => setPassword(e.target.value)} />
        </div>
        <button type="submit">Login</button>
        {error && <p>{error}</p>}
      </form>
    </div>
  );
};

export default AdminLogin;
