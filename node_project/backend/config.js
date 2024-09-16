module.exports = {
  user: 'sa',
  password: '74euW1Njse3T0-a',
  database: 'Advising_System',
  driver: 'msnodesqlv8',
  server: 'localhost',
  port: 1433,
  pool: {
    max: 10,
    min: 0,
    idleTimeoutMillis: 30000,
  },
  options: {
    encrypt: true,
    trustServerCertificate: true,
  },
}

// module.exports = {
//   user: process.env.DB_USER,
//   password: process.env.DB_PASS,
//   database: process.env.DATABASE,
//   driver: 'msnodesqlv8',
//   server: process.env.SERVER_NAME,
//   port: 1433,
//   pool: {
//     max: 10,
//     min: 0,
//     idleTimeoutMillis: 30000,
//   },
//   options: {
//     encrypt: true,
//     trustServerCertificate: true,
//   },
// }
