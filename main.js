const fastify = require('fastify')(
    // {logger: true}
)


// Declare a route
fastify.get('/', function (request, reply) {
    reply.send({ msg:'Wellcome'})
})

// fastify.register(require('./routes/carnet.js'), { prefix: '/v1' })
fastify.register(require('./routes/carnet.js'))


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