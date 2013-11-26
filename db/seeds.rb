# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Size.create([
  {name: "6"},
  {name: "6.5"},
  {name: "7"},
  {name: "7.5"},
  {name: "8"},
  {name: "8.5"},
  {name: "9"},
  {name: "9.5"},
  {name: "10"},
  {name: "10.5"},
  {name: "11"},
  {name: "11.5"},
  {name: "12"},
  {name: "12.5"},
  {name: "13"},
  {name: "13.5"},
  {name: "14"},
  {name: "14.5"},
])
puts 'sizes created'

user = User.create(email: "blair@example.com", username: 'blair')
puts "#{user.username} created with email: #{user.email}"