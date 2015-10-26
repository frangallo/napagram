json.extract! comment, :id, :body, :author_id, :media_id
json.author do
  json.username comment.author.username
  json.quote comment.author.quote
  json.avatar comment.author.picture
  json.id comment.author.id
end
