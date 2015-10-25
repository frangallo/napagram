# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

names = ["fran", "greg", "steve", "kerry", "doug", "larry", "amanda", "lauren", "laura", "megan"]

10.times do |x|
  User.create[{username:names[x], }]
