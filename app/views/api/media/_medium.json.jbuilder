json.extract! post, :id, :location, :description, :author_id, :created_at
json.picture post.picture
json.author post.author
json.num_likes post.likes.length
json.like likes_hash[post.id]
json.likers post.likers do |liker|
  json.extract! liker, :username, :quote, :created_at
  json.avatar liker.picture
end
json.comments post.comments do |comment|
  json.partial!('api/comments/comment', comment: comment)
end
