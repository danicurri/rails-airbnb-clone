# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
puts 'destroying'
Flat.destroy_all
User.destroy_all
puts 'destroyed'

pictures = ["http://suitelife.com/blog/wp-content/uploads/2016/07/SARAFOLCH1.jpg", "https://static.dezeen.com/uploads/2017/05/kettal-barcelona-showroom-patricia-urquiola-interiors-retail-spain_dezeen_sq-b-411x411.jpg", "https://cdn.decoist.com/wp-content/uploads/2012/11/Mies-Van-Der-Rohe-Barcelona-Chair-4.jpg", "http://www.archiscene.net/wp-content/uploads/2016/01/Culture-Clash-in-stylish-Barcelona-Apartment.jpg", "http://www.iheartberlin.de/wp-content/uploads/2015/09/Hallesches-Haus-6806.jpg", "https://imgs.6sqft.com/wp-content/uploads/2016/06/20212258/Summer-Rayne-Oakes-Plant-Filled-Apartment-in-Williamsburg-Brooklyn-kitchen.jpg", "https://laurelberninteriors.com/wp-content/uploads/2013/08/westchesternysittingroom.png", "https://i.pinimg.com/736x/44/8b/12/448b12c6c1c2781f0385591cc1ab9282--interior-plants-vinyl-music.jpg", "http://architectdublin.ie/wp-content/gallery/faugheen-interiors/faugheen-9-05.jpg", "https://theirishaesthete.files.wordpress.com/2014/05/img_3385.jpg", "https://i.pinimg.com/736x/16/2c/cd/162ccdaf40e5d92f17a30a22433c5179--cottages-ireland-cottage-fireplace.jpg", "https://i.pinimg.com/736x/d1/c7/bc/d1c7bc9f327b33a95ce56cef7a8de1d8--country-house-interior-country-interiors.jpg"]


puts "Creating 18 fake flats"
18.times do
  user = User.create!(
    name: Faker::Name.name_with_middle,
    email: Faker::Internet.email,
    password: Faker::Internet.password)

  flat = Flat.create(
    address: Faker::Address.city,
    description: Faker::Lorem.sentence(3, false, 4),
    title: Faker::GameOfThrones.city,
    price: rand(80...150).to_i,
    user: user,
    remote_photo_url: pictures.sample
    )

end
puts 'finished'
