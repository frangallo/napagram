json.array! @users do |user|
  json.extract! user,  :username, :quote, :created_at
  json.following? @following_hash[user.id]
end
