import './App.css'
import { Button } from 'antd'
import { Outlet, useNavigate, useLocation, matchRoutes } from 'react-router-dom'
import mainMenu from './content/mainMenu'

function App() {
  const navigate = useNavigate()
  const loc = useLocation()
  const route = matchRoutes(
    mainMenu.map((e) => ({ path: e.path })),
    loc
  )
  return (
    <div className='App'>
      <Button
        style={{ left: '24px', position: 'absolute', top: '24px' }}
        type='primary'
        onClick={() =>
          !route
            ? (window.location.href = 'http://localhost:3003')
            : navigate('/')
        }
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
