json.extract! @user,  :id, :username, :quote, :created_at
json.picture @user.picture
json.following? @following_hash[user.id]

json.followers @user.followers do |follower|
  json.extract! follower, :id, :username, :quote, :created_at
  json.avatar follower.picture
end

json.followers_count @user.followers.length
json.follwing_count @user.following.length

json.following @user.following do |follow|
  json.extract! follow, :id, :username, :quote, :created_at
  json.avatar follow.picture
end

json.total_posts @user.posts.length
json.posts @user.posts do |post|
  json.partial!('api/media/medium', post: post, likes_hash: {})

  json.comments post.comments do |comment|
    json.partial!('api/comments/comment', comment: comment)
  end
end
