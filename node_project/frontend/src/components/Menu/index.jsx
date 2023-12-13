import { Button } from 'antd'
import './index.css'
import mainMenu from '../../content/mainMenu'
import { useNavigate } from 'react-router-dom'

const Menu = () => {
  const navigate=useNavigate()
  return (
    <div className='button_menu'>
      {mainMenu.map((item, index) => (
        <Button key={index} type='primary' size='large' onClick={()=>navigate(item.path)}>
          {item.option}
        </Button>
      ))}
    </div>
  )
}

export default Menu
