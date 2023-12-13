import './App.css'
import { Button } from 'antd'
import { Outlet, useNavigate } from 'react-router-dom'

function App() {
  const navigate = useNavigate()
  return (
    <div className='App'>
      <Button
        style={{ left: '24px', position: 'absolute', top: '24px' }}
        type='primary'
        onClick={() => navigate('/')}
      >
        Go back
      </Button>
      <h1>
        <strong>Advising Students Management System </strong>
      </h1>

      <Outlet />
    </div>
  )
}

export default App
