import e from '../../dbschema/edgeql-js'

export default defineEventHandler(async (event) => {
  const client = useEdgeDb(event)

  const query = e.select(e.User, (user) => ({
    id: true,
    userRole: true,
    filter_single: e.op(user, '=', e.global.current_user),
  }))

  const user = await query.run(client)
  return user
})
