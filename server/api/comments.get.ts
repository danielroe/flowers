import e from '../../dbschema/edgeql-js'

export default defineEventHandler(async event => {
  const client = useEdgeDb(event)

  const query = e.select(e.Comment, (comment) => ({
    text: comment.text,
    id: true,
    isCurrent: e.op(comment.author, '=', e.global.current_user),
    filter: e.op(
      e.op(comment.public, '=', true),
      'or',
      e.op(comment.author, '=', e.global.current_user)
    )
  }))

  const comments = await query.run(client)
  return comments
})
