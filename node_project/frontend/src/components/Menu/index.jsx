import { Button } from 'antd'
import './index.css'
import mainMenu from '../../content/mainMenu'
import { useNavigate, useSearchParams } from 'react-router-dom'
import { useEffect } from 'react'

const Menu = () => {
  const navigate = useNavigate()
  const [searchParams] = useSearchParams()
  useEffect(() => {
    if (searchParams.get('student_id')) {
      localStorage.setItem('student_id', searchParams.get('student_id'))
      navigate('/')
    }
  }, [])

  console.log()
  return (
    <div className='button_menu'>
      {mainMenu.map((item, index) => (
        <Button
          key={index}
          type='primary'
          size='large'
          onClick={() => navigate(item.path)}
        >
          {item.option}
        </Button>
      ))}
    </div>
  )
}

export default Menu
