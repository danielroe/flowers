import e from "../../dbschema/edgeql-js";

export default defineEventHandler(async event => {
  const { text, public: isPublic } = await readBody(event) || {}
  if (!text || isPublic === undefined) {
    throw createError({ statusCode: 422 })
  }
  const identity = await useEdgeDbIdentity <{ id: string }>(event)
  if (!identity.isLoggedIn) {
    throw createError({ statusCode: 401 })
  }

  const client = useEdgeDb(event)

  const query = e.insert(e.Comment, {
    text,
    public: isPublic,
  })
 
  await query.run(client)
  return null
})
