// const fastify = require('fastify')()
const { getPersons, getAllPersons } = require('../controllers/license.controller')

const route = [
    {
        url: '/license',
        method: 'GET',
        handler: getAllPersons,
    },
    {
        url: '/license/:ic',
        method: 'GET',
        handler: getPersons,
    }
]

module.exports = route