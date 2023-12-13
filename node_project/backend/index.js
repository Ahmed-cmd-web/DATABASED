const express = require('express')
const morgan = require('morgan')
const cors = require('cors')
const dotenv = require('dotenv')
const routes = require('./routes')
const sql = require('mssql')
const config = require('./config')
dotenv.config()

const app = express()

const pool = new sql.ConnectionPool(config)
pool.connect((err) =>
  console.log(
    err ? err : `connected to the db:${config.database} successfully...`
  )
)

app.use(cors())
app.use(express.json())
app.use(express.urlencoded({ extended: false }))
app.use(morgan('dev'))

routes.map((e) =>
  app[e.type](e.path, async (req, res) => {
    let request = new sql.Request(pool)
    try {
      let tb = await request.query(e.query(req.params))
      res.status(200).send(tb.recordset)
    } catch (error) {
      console.log(error)
      res.send(error).status(400)
    }
  })
)

const port = process.env.SERVER_PORT || 8000

app.listen(port, () => console.log(`Server is running on port: ${port}`))
