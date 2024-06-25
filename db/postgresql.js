const { Pool } = require('pg')

const pool = new Pool({
    host: "localhost",
    user: "postgres",
    password: "28076011",
    database: "carnet",
    port: "5432"
})

const query = (text, params, callback) => {
    return pool.query(text, params, callback)
}

module.exports = {pool,query}