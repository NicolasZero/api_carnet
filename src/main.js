const fastify = require('fastify')(
    {logger: false}
)

const cors = require('@fastify/cors') 

const routeLicense = require('./routes/license.route.js')

fastify.register(cors, { 
  // put your options here
})


// Declare a route
fastify.get('/api', (request, reply) => {
    reply
    .code(200)
    // .header('Content-Type', 'aplication/json; charset=utf-8')
    .send({ msg:'Wellcome'})
})

routeLicense.forEach(route => {
    fastify.route(route)
})
// fastify.register(require('./routes/license.route.js'), { prefix: '/license' })
// fastify.register(require('./routes/license.route.js'), { prefix: '/validate' })


// Run the server!
const start = async () => {
    try {
        await fastify.listen({ port: 3000, host: '0.0.0.0' })
        console.log(`Api en linea`)
    } catch (err) {
        fastify.log.error(err)
        process.exit(1)
    }
}

start()