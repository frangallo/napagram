json.array! @posts.each do |post|
  json.partial!('medium', post: post, likes_hash: @likes_hash)
end
