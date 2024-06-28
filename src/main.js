const fastify = require('fastify')(
    {logger: false}
)

const routeLicense = require('./routes/license.route.js')

// Declare a route
fastify.get('/', (request, reply) => {
    reply.send({ msg:'Wellcome'})
})

routeLicense.forEach(route => {
    fastify.route(route)
})
// fastify.register(require('./routes/license.route.js'), { prefix: '/license' })
// fastify.register(require('./routes/license.route.js'), { prefix: '/validate' })


// Run the server!
const start = async () => {
    try {
        await fastify.listen({ port: 3000 })
        console.log(`Api en linea`)
    } catch (err) {
        fastify.log.error(err)
        process.exit(1)
    }
}

start()