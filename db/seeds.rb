# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

Flat.destroy_all
User.destroy_all

puts "Creating 20 fake flats"
20.times do
  user = User.new(
    name: Faker::Name.name_with_middle,
    email: Faker::Internet.email,
    password: Faker::Internet.password)
  user.save!

  flat = Flat.new(
    address: Faker::Address.city,
    description: Faker::Lorem.sentence(3, false, 4),
    title: Faker::GameOfThrones.city,
    price: rand(80...150).to_i,
    user: user)
  flat.save!
end
puts 'finished'
