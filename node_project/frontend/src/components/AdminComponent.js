import React from 'react'
import { useNavigate } from 'react-router-dom'
import adminMainMenu from '../content/adminMainMenu'
import { Button } from 'antd'
import '../components/Menu/index.css'
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
  cursor: 'pointer',
}

const AdminComponent = () => {
  const navigate = useNavigate()
  return (
    <div className='button_menu'>
      {adminMainMenu.map((item, index) => (
        <Button
          key={index}
          type='primary'
          size='large'
          onClick={() => navigate(`..${item.path}`)}
        >
          {item.option}
        </Button>
      ))}
    </div>
  )
}

export default AdminComponent
