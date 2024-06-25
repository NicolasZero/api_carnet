// const fastify = require('fastify')()
const {getPersons} = require('../controllers/carnet')

module.exports = function async (fastify, opts, done) {
    fastify.get('/user', getPersons)
    done()
}