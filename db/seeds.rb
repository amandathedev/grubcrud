# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "faker"

15.times do
  Cuisine.create(
    name: Faker::Restaurant.unique.type,
    image: Faker::LoremFlickr.image("150x160", ['food'])
  )
end

50.times do
  Restaurant.create(
    name: Faker::Restaurant.unique.name,
    phone_number: Faker::PhoneNumber.unique.cell_phone,
    rating: Faker::Number.between(1, 100),
    review: Faker::Restaurant.review,
    image: Faker::LoremFlickr.image("150x160", ['restaurant']),
    cuisine_id: Cuisine.find(Faker::Number.between(1, 15)).id,
    description: Faker::Restaurant.description
  )
end

100.times do
  User.create(
    name: Faker::Name.unique.name,
    username: Faker::Internet.unique.username,
    password: Faker::Internet.password,
    address: Faker::Address.full_address,
    email: Faker::Internet.unique.email,
    phone_number: Faker::PhoneNumber.unique.cell_phone
  )
end

500.times do
  Item.create(
    name: Faker::Food.dish,
    price: Faker::Commerce.price,
    image: Faker::LoremFlickr.image("150x160", ['food']),
    restaurant_id: Faker::Number.between(1, 15)
  )
end

5.times do
  Order.create(
    user_id: Faker::Number.between(1, 100),
    status: Faker::Boolean.boolean
  )
end
