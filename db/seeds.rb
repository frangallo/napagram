# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
pics = ["http://i.imgur.com/B9CLiIg.png",
        "http://i.imgur.com/rdBvisz.png",
        "http://i.imgur.com/bOnE3sS.png",
        "http://i.imgur.com/4O7272w.png",
        "http://i.imgur.com/4O7272w.png",
        "http://i.imgur.com/l6WWdz4.png",
        "http://i.imgur.com/5Iqr6a6.png",
        "http://i.imgur.com/VjIPzNe.png",
        "http://i.imgur.com/Wr20F01.png",
        "http://i.imgur.com/bEiI2lt.png",
        "http://i.imgur.com/ELMf49L.png",
        "http://i.imgur.com/3OdpWna.png",
        "http://i.imgur.com/E3ZftJ9.png",
        "http://i.imgur.com/LfS9ATC.png",
        "http://i.imgur.com/ibPxPeb.png",
        "http://i.imgur.com/TyqNomc.png",
        "http://i.imgur.com/YJsFOVo.png",
        "http://i.imgur.com/0RWKf4x.png",
        "http://i.imgur.com/GkFCmOl.png",
        "http://i.imgur.com/j54T6IZ.png",
        "http://i.imgur.com/He8b8YX.png"]
avatars = ["http://res.cloudinary.com/frankyg/image/upload/c_scale,w_302/v1446778243/bbevbh09dsksnmhjvjx3.jpg"]

names = ["fran", "greg", "steve", "kerry", "doug", "larry", "amanda", "lauren", "laura", "megan"]
ids = (1..10).to_a
10.times do |x|
  User.create({username: names[x],
              session_token: names[x],
              password_digest: names[x],
              quote: names[x]})
end

10.times do |x|
  Picture.create({url:avatars[0], thumb_url:avatars[0], imageable_id: x+1, imageable_type: "User" })
end

50.times do |x|
  Medium.create({description: names.sample,
                author_id: ids.sample})
end

50.times do |x|
    Picture.create({url:pics.sample, imageable_id: x+1, imageable_type: "Medium"})
end


10.times do |x|
  Like.create({media_id: ids.sample, user_id: ids.sample})
  Picture.create({url: "www.google.com", imageable_id: x+1, imageable_type: "User"})
end



25.times do |x|
  rand1 = rand(1..10)
  rand2 = rand(1..10)
  until rand2 != rand1
    rand2 = rand(1..10)
  end

  Follower.create({follower_id: rand1, followee_id: rand2})
  Comment.create({body: "Hello#{x}", author_id: rand1, media_id: rand2 })
end
