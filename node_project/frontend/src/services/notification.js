import { notification } from 'antd'

const notify = ({ message, desc, type = 'info' }) => {
  notification.open({
    message,
    description: desc,
    type,
  })
}

export default notify
