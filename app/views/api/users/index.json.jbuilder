json.array! @users do |user|
  json.extract! user,  :id, :username, :quote, :created_at
  json.following? @following_hash[user.id]
end
