import React, { useState, useEffect } from 'react';

const ListAdvisors = () => {
  const [advisors, setAdvisors] = useState([]);

  useEffect(() => {
    fetch('/api/advisors')
      .then(response => response.json())
      .then(data => setAdvisors(data))
      .catch(error => console.error('Error fetching data: ', error));
  }, []);

  return (
    <div>
      <h2>Advisors List</h2>
      <ul>
        {advisors.map(advisor => (
          <li key={advisor.id}>{advisor.name}</li>
        ))}
      </ul>
    </div>
  );
};

export default ListAdvisors;