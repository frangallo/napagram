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

names = ["fran", "greg", "steve", "kerry", "doug", "larry", "amanda", "lauren",
        "laura", "megan", "sophia", "jackson", "emma", "aiden", "liam", "lucas",
        "olivia", "ava", "noah", "isabella", "mason", "mia", "ethan", "zoe",
        "caden", "lily", "jacob", "emily", "logan", "madelyn", "jake", "mitch",
        "ed", "will", "tracie", "ehsan", "sid", "samantha", "sarah"]

comments = ["aww", "so cute!!", "love this", "adorable", "this is perfect", "i want one", "omg!! soooo cute",
            "where can I get one?!?", "this is amazing", "loveeeee", "it's so fluffy", "hahahaha", "give meeee",
          "omfgggg", "Too cute!!!", "YASSSS", "bring me that!", "late night pick me up, so cute!", "extreme cuteness!",
          "OMG! neeeed!", "oh my gawwwd", "this is exactly how I feel", "me right now", "I'm dying", ]

description = ["sleepy time", "what I want to be doing", "can't hang", "too. much. eggnog.", "my world. you're just living in it",
              "netflix and chill", "Is it Friday yet?", "#napagramzzz", "love my sunday naps", "I guess we're done here...", "this dude can't hang", "December has us like.....",
              "Differing standards of nap comfort", "Morning snuggles on vacation", "and I'm out", "I'll just sleep right here", "zzzzzzz's"]
ids = (1..30).to_a
posts = (1..500).to_a
30.times do |x|
  u = User.create({username: names[x],
              session_token: Faker::Code.ean,
              password_digest: Faker::Internet.password(16, 16),
              quote: names[x]})

  pic1 = Faker::Avatar.image

  Picture.create({url: pic1,
                  thumb_url: pic1,
                  imageable_id: (u.id),
                  imageable_type: "User" })
end

500.times do |x|
  pic = pics.sample
  m = Medium.create({description: names.sample,
                author_id: ids.sample})
  Picture.create({url:pic, thumb_url:pic,  imageable_id: (m.id), imageable_type: "Medium"})
end

5000.times do |x|
  Like.create({media_id: posts.sample, user_id: ids.sample})
end

300.times do |x|
  rand1 = rand(1..30)
  rand2 = rand(1..30)
  until rand2 != rand1
    rand2 = rand(1..10)
  end

  Follower.create({follower_id: rand1, followee_id: rand2})
end

5000.times do |x|
  rand3 = rand(1..30)
  rand4 = rand(1..500)

  Comment.create({body: comments.sample, author_id: rand3, media_id: rand4 })
end
