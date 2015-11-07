json.array!(@users) do |user|
  json.id user.id
  json.username user.username
  json.picture do
    json.id user.picture.id
    json.url user.picture.url
    json.thumb_url user.picture.thumb_url
  end

end
