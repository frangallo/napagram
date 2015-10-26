json.array! @posts.each do |post|
  json.partial!('api/media/medium', post: post)
end
