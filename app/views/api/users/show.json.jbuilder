json.extract! @user,  :id, :username, :quote, :created_at
json.picture @user.picture

json.followers @user.followers do |follower|
  json.extract! follower, :id, :username, :quote, :created_at
  json.avatar follower.picture
end

json.following @user.following do |follow|
  json.extract! follow, :username, :quote, :created_at
  json.avatar follow.picture
end

json.posts @user.posts do |post|
  json.extract! post,  :id, :location, :description, :author_id, :created_at
  json.picture post.picture
  json.likes post.likes.length

  json.likers post.likers do |liker|
    json.extract! liker, :id, :username, :quote, :created_at
    json.avatar liker.picture
  end

  json.comments post.comments do |comment|
    json.extract! comment, :id, :body, :author_id, :media_id
    json.author do
      json.username comment.author.username
      json.quote comment.author.quote
      json.avatar comment.author.picture
      json.id comment.author.id
    end
  end
end
