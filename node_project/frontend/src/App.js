import './App.css'
import { Button } from 'antd'
import { Outlet, useNavigate, useLocation, matchRoutes } from 'react-router-dom'
import studentMainMenu from './content/studentMainMenu'
import adminMainMenu from './content/adminMainMenu'

function App() {
  const navigate = useNavigate()
  const loc = useLocation()
  const route = matchRoutes(
    [
      ...studentMainMenu.map((e) => ({ path: `student${e.path}` })),
      ...adminMainMenu.map((e) => ({ path: `adminPart1${e.path}` })),
    ],
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
            : navigate(
                loc.pathname.includes('adminPart1')
                  ? '/adminPart1/dashboard'
                  : 'student/menu'
              )
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
