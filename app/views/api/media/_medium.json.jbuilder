json.extract! post, :location, :description, :author_id, :created_at
json.picture post.picture
json.author post.author
json.likes post.likes.length
json.likers post.likers do |liker|
  json.extract! liker, :username, :quote, :created_at
  json.avatar liker.picture
end
