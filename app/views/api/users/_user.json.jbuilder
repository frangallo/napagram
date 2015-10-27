json.extract! @user,  :id, :username, :quote, :created_at
json.picture @user.picture

json.followers @user.followers do |follower|
  json.extract! follower, :id, :username, :quote, :created_at
  json.avatar follower.picture
end

json.followers_count @user.followers.length
json.follwing_count @user.following.length

json.following @user.following do |follow|
  json.extract! follow, :username, :quote, :created_at
  json.avatar follow.picture
end

json.posts @user.posts do |post|
  json.partial!('api/media/medium', post: post)

  json.comments post.comments do |comment|
    json.partial!('api/comments/comment', comment: comment)
  end
end
