# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

case Rails.env
when "development"
  puts "Redoing DB..."
  User.destroy_all
  Planet.destroy_all
  Order.destroy_all
  10.times do
    user = User.create!(
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      email: Faker::Internet.email,
      password: "123123"
    )

    Planet.create!(
      name: Faker::Game.title,
      galaxy: Faker::Music.band,
      price: rand(50_000..1_000_000),
      size: rand(500..10_000),
      temperature: rand(0..500),
      pressure: rand(1..100),
      user: user
    )
  end
  puts "Fineshed"
end
