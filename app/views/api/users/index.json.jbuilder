json.array! @users do |user|
  json.extract! user,  :username, :quote, :created_at
end
