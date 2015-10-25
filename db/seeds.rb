# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

names = ["fran", "greg", "steve", "kerry", "doug", "larry", "amanda", "lauren", "laura", "megan"]
ids = (1..10).to_a
10.times do |x|
  User.create({username: names[x],
              session_token: names[x],
              password_digest: names[x],
              quote: names[x]})
  Medium.create({description:names[x],
                author_id: ids.sample})

end

10.times do |x|
  Like.create({media_id: ids.sample, user_id: ids.sample})
end

25.times do |x|
  rand1 = rand(1..10)
  rand2 = rand(1..10)
  until rand2 != rand1
    rand2 = rand(1..10)
  end

  Follower.create({follower_id: rand1, followee_id: rand2})
  Comment.new({body: "Hello#{x}", author_id: rand1, media_id: rand2 })
end
