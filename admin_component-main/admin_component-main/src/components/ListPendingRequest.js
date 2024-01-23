import React, { useState, useEffect } from 'react';

const ListPendingRequests = () => {
  const [pendingRequests, setPendingRequests] = useState([]);

  useEffect(() => {
    fetch('/api/pending-requests')
      .then(response => response.json())
      .then(data => setPendingRequests(data))
      .catch(error => console.error('Error fetching data: ', error));
  }, []);

  return (
    <div>
      <h2>Pending Requests</h2>
      <ul>
        {pendingRequests.map(request => (
          <li key={request.id}>
            {request.type} - Submitted by: {request.submitter} (Status: {request.status})
          </li>
        ))}
      </ul>
    </div>
  );
};

export default ListPendingRequests;