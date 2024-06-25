const { query } = require('../db/postgresql')

const getPersons = async (request, reply) => {
    try {

        const result = await query('select * from persons')
        // console.log(process.env.DB_HOST)
        return reply.send({data:result.rows})
        // return reply.send({data:0})
    } catch (error) {
        reply.send({error:'error'})
        console.log(error)
    }
    // reply.send({ id: 1, name: 'Nicolas', lastname: 'Zapata', ci: 28076011, cargo: 'coordinador'})
}

module.exports = {
    getPersons
}