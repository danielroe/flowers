import e from "../../../dbschema/edgeql-js"

export default defineEventHandler(async event => {
  const identity = await useEdgeDbIdentity(event)
  const id = getRouterParam(event, 'id') as string
  if (!identity.isLoggedIn) {
    throw createError({ statusCode: 401 })
  }

  const client = useEdgeDb(event)

  const query = e.delete(e.Comment, (comment) => ({
    filter_single: { id }
  }))

  await query.run(client)
  return null
})
