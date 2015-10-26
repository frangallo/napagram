json.array! @posts.each do |post|
  json.partial!('medium', post: post)
end
