json.extract! @user,  :username, :quote, :created_at
json.posts @user.posts do |post|
  json.extract! post,  :location, :description, :author_id, :created_at
  json.picture post.picture
  json.likes post.likes.length

  json.likers post.likers do |liker|
    json.extract! liker, :username, :quote, :created_at
    json.avatar liker.picture
  end

  json.comments post.comments do |comment|
    json.extract! comment, :body, :author_id, :media_id
    json.author comment.author
    json.author_avatar comment.author.picture
  end
end
