# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "faker"

15.times do
  begin
    response =  RestClient::Request.execute(method: :get, url: "https://loremflickr.com/600/400/food", max_redirects: 0)
  rescue RestClient::ExceptionWithResponse => err
    err.response.inspect
    if err.response.code == 302
      @food_url = err.response.headers[:location]
      @food_url
    end
  end
  Cuisine.create(
    name: Faker::Restaurant.unique.type,
    img_url: @food_url
  )
end

50.times do
  begin
    response =  RestClient::Request.execute(method: :get, url: "https://loremflickr.com/600/400/food", max_redirects: 0)
  rescue RestClient::ExceptionWithResponse => err
    err.response.inspect
    if err.response.code == 302
      @food_url = err.response.headers[:location]
      @food_url
    end
  end
    Restaurant.create(
      name: Faker::Restaurant.unique.name,
      phone_number: Faker::PhoneNumber.unique.cell_phone,
      rating: Faker::Number.between(1, 100),
      review: Faker::Restaurant.review,
      img_url: @food_url,
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

100.times do
  begin
    response =  RestClient::Request.execute(method: :get, url: "https://loremflickr.com/600/400/food", max_redirects: 0)
  rescue RestClient::ExceptionWithResponse => err
    err.response.inspect
    if err.response.code == 302
      @food_url = err.response.headers[:location]
      @food_url
    end
  end
  Item.create(
    name: Faker::Food.dish,
    price: Faker::Commerce.price,
    img_url: @food_url,
    restaurant_id: Faker::Number.between(1, 30)
  )
end

5.times do
  Order.create(
    user_id: Faker::Number.between(1, 100),
    status: Faker::Boolean.boolean
  )
end


# Restaurant.create(name: Faker::Restaurant.unique.name, phone_number: Faker::PhoneNumber.unique.cell_phone, rating: Faker::Number.between(1, 100), review: Faker::Restaurant.review, img_url: "https://images.unsplash.com/photo-1504674900247-0877df9cc836?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60", cuisine_id: Cuisine.find(Faker::Number.between(1, 15)).id, description: Faker::Restaurant.description)
# Restaurant.create(name: Faker::Restaurant.unique.name, phone_number: Faker::PhoneNumber.unique.cell_phone, rating: Faker::Number.between(1, 100), review: Faker::Restaurant.review, img_url: "https://images.unsplash.com/photo-1496116218417-1a781b1c416c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60", cuisine_id: Cuisine.find(Faker::Number.between(1, 15)).id, description: Faker::Restaurant.description)
# Restaurant.create(name: Faker::Restaurant.unique.name, phone_number: Faker::PhoneNumber.unique.cell_phone, rating: Faker::Number.between(1, 100), review: Faker::Restaurant.review, img_url: "https://images.unsplash.com/photo-1496116218417-1a781b1c416c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60", cuisine_id: Cuisine.find(Faker::Number.between(1, 15)).id, description: Faker::Restaurant.description)
# Restaurant.create(name: Faker::Restaurant.unique.name, phone_number: Faker::PhoneNumber.unique.cell_phone, rating: Faker::Number.between(1, 100), review: Faker::Restaurant.review, img_url: "https://images.unsplash.com/photo-1506354666786-959d6d497f1a?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60", cuisine_id: Cuisine.find(Faker::Number.between(1, 15)).id, description: Faker::Restaurant.description)
# Restaurant.create(name: Faker::Restaurant.unique.name, phone_number: Faker::PhoneNumber.unique.cell_phone, rating: Faker::Number.between(1, 100), review: Faker::Restaurant.review, img_url: "https://images.unsplash.com/photo-1424847651672-bf20a4b0982b?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60", cuisine_id: Cuisine.find(Faker::Number.between(1, 15)).id, description: Faker::Restaurant.description)
# Restaurant.create(name: Faker::Restaurant.unique.name, phone_number: Faker::PhoneNumber.unique.cell_phone, rating: Faker::Number.between(1, 100), review: Faker::Restaurant.review, img_url: "https://images.unsplash.com/photo-1506354666786-959d6d497f1a?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60", cuisine_id: Cuisine.find(Faker::Number.between(1, 15)).id, description: Faker::Restaurant.description)
# Restaurant.create(name: Faker::Restaurant.unique.name, phone_number: Faker::PhoneNumber.unique.cell_phone, rating: Faker::Number.between(1, 100), review: Faker::Restaurant.review, img_url: "https://images.unsplash.com/photo-1490645935967-10de6ba17061?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60", cuisine_id: Cuisine.find(Faker::Number.between(1, 15)).id, description: Faker::Restaurant.description)
# Restaurant.create(name: Faker::Restaurant.unique.name, phone_number: Faker::PhoneNumber.unique.cell_phone, rating: Faker::Number.between(1, 100), review: Faker::Restaurant.review, img_url: "https://images.unsplash.com/photo-1490645935967-10de6ba17061?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60", cuisine_id: Cuisine.find(Faker::Number.between(1, 15)).id, description: Faker::Restaurant.description)
# Restaurant.create(name: Faker::Restaurant.unique.name, phone_number: Faker::PhoneNumber.unique.cell_phone, rating: Faker::Number.between(1, 100), review: Faker::Restaurant.review, img_url: "https://images.unsplash.com/photo-1424847651672-bf20a4b0982b?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60", cuisine_id: Cuisine.find(Faker::Number.between(1, 15)).id, description: Faker::Restaurant.description)
# Restaurant.create(name: Faker::Restaurant.unique.name, phone_number: Faker::PhoneNumber.unique.cell_phone, rating: Faker::Number.between(1, 100), review: Faker::Restaurant.review, img_url: "https://images.unsplash.com/photo-1473093295043-cdd812d0e601?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60", cuisine_id: Cuisine.find(Faker::Number.between(1, 15)).id, description: Faker::Restaurant.description)
# Restaurant.create(name: Faker::Restaurant.unique.name, phone_number: Faker::PhoneNumber.unique.cell_phone, rating: Faker::Number.between(1, 100), review: Faker::Restaurant.review, img_url: "https://images.unsplash.com/photo-1473093226795-af9932fe5856?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60", cuisine_id: Cuisine.find(Faker::Number.between(1, 15)).id, description: Faker::Restaurant.description)
# Restaurant.create(name: Faker::Restaurant.unique.name, phone_number: Faker::PhoneNumber.unique.cell_phone, rating: Faker::Number.between(1, 100), review: Faker::Restaurant.review, img_url: "https://images.unsplash.com/photo-1473093226795-af9932fe5856?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60", cuisine_id: Cuisine.find(Faker::Number.between(1, 15)).id, description: Faker::Restaurant.description)
# Restaurant.create(name: Faker::Restaurant.unique.name, phone_number: Faker::PhoneNumber.unique.cell_phone, rating: Faker::Number.between(1, 100), review: Faker::Restaurant.review, img_url: "https://images.unsplash.com/photo-1499028344343-cd173ffc68a9?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60", cuisine_id: Cuisine.find(Faker::Number.between(1, 15)).id, description: Faker::Restaurant.description)
# Restaurant.create(name: Faker::Restaurant.unique.name, phone_number: Faker::PhoneNumber.unique.cell_phone, rating: Faker::Number.between(1, 100), review: Faker::Restaurant.review, img_url: "https://images.unsplash.com/photo-1499028344343-cd173ffc68a9?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60", cuisine_id: Cuisine.find(Faker::Number.between(1, 15)).id, description: Faker::Restaurant.description)
# Restaurant.create(name: Faker::Restaurant.unique.name, phone_number: Faker::PhoneNumber.unique.cell_phone, rating: Faker::Number.between(1, 100), review: Faker::Restaurant.review, img_url: "https://images.unsplash.com/photo-1473093295043-cdd812d0e601?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60", cuisine_id: Cuisine.find(Faker::Number.between(1, 15)).id, description: Faker::Restaurant.description)
# Restaurant.create(name: Faker::Restaurant.unique.name, phone_number: Faker::PhoneNumber.unique.cell_phone, rating: Faker::Number.between(1, 100), review: Faker::Restaurant.review, img_url: "https://images.unsplash.com/photo-1466978913421-dad2ebd01d17?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60", cuisine_id: Cuisine.find(Faker::Number.between(1, 15)).id, description: Faker::Restaurant.description)
# Restaurant.create(name: Faker::Restaurant.unique.name, phone_number: Faker::PhoneNumber.unique.cell_phone, rating: Faker::Number.between(1, 100), review: Faker::Restaurant.review, img_url: "https://images.unsplash.com/photo-1466978913421-dad2ebd01d17?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60", cuisine_id: Cuisine.find(Faker::Number.between(1, 15)).id, description: Faker::Restaurant.description)
# Restaurant.create(name: Faker::Restaurant.unique.name, phone_number: Faker::PhoneNumber.unique.cell_phone, rating: Faker::Number.between(1, 100), review: Faker::Restaurant.review, img_url: "https://unsplash.com/photos/aWWl29-VX7Y", cuisine_id: Cuisine.find(Faker::Number.between(1, 15)).id, description: Faker::Restaurant.description)
# Restaurant.create(name: Faker::Restaurant.unique.name, phone_number: Faker::PhoneNumber.unique.cell_phone, rating: Faker::Number.between(1, 100), review: Faker::Restaurant.review, img_url: "https://unsplash.com/photos/hrlvr2ZlUNk", cuisine_id: Cuisine.find(Faker::Number.between(1, 15)).id, description: Faker::Restaurant.description)
# Restaurant.create(name: Faker::Restaurant.unique.name, phone_number: Faker::PhoneNumber.unique.cell_phone, rating: Faker::Number.between(1, 100), review: Faker::Restaurant.review, img_url: "https://unsplash.com/photos/ddZYOtZUnBk", cuisine_id: Cuisine.find(Faker::Number.between(1, 15)).id, description: Faker::Restaurant.description)
# Restaurant.create(name: Faker::Restaurant.unique.name, phone_number: Faker::PhoneNumber.unique.cell_phone, rating: Faker::Number.between(1, 100), review: Faker::Restaurant.review, img_url: "https://unsplash.com/photos/Yr4n8O_3UPc", cuisine_id: Cuisine.find(Faker::Number.between(1, 15)).id, description: Faker::Restaurant.description)
# Restaurant.create(name: Faker::Restaurant.unique.name, phone_number: Faker::PhoneNumber.unique.cell_phone, rating: Faker::Number.between(1, 100), review: Faker::Restaurant.review, img_url: "https://unsplash.com/photos/LR559Dcst70", cuisine_id: Cuisine.find(Faker::Number.between(1, 15)).id, description: Faker::Restaurant.description)
# Restaurant.create(name: Faker::Restaurant.unique.name, phone_number: Faker::PhoneNumber.unique.cell_phone, rating: Faker::Number.between(1, 100), review: Faker::Restaurant.review, img_url: "https://unsplash.com/photos/oT7_v-I0hHg", cuisine_id: Cuisine.find(Faker::Number.between(1, 15)).id, description: Faker::Restaurant.description)
# Restaurant.create(name: Faker::Restaurant.unique.name, phone_number: Faker::PhoneNumber.unique.cell_phone, rating: Faker::Number.between(1, 100), review: Faker::Restaurant.review, img_url: "https://unsplash.com/photos/ddZYOtZUnBk", cuisine_id: Cuisine.find(Faker::Number.between(1, 15)).id, description: Faker::Restaurant.description)
# Restaurant.create(name: Faker::Restaurant.unique.name, phone_number: Faker::PhoneNumber.unique.cell_phone, rating: Faker::Number.between(1, 100), review: Faker::Restaurant.review, img_url: "https://unsplash.com/photos/1Shk_PkNkNw", cuisine_id: Cuisine.find(Faker::Number.between(1, 15)).id, description: Faker::Restaurant.description)
# Restaurant.create(name: Faker::Restaurant.unique.name, phone_number: Faker::PhoneNumber.unique.cell_phone, rating: Faker::Number.between(1, 100), review: Faker::Restaurant.review, img_url: "https://unsplash.com/photos/oT7_v-I0hHg", cuisine_id: Cuisine.find(Faker::Number.between(1, 15)).id, description: Faker::Restaurant.description)
# Restaurant.create(name: Faker::Restaurant.unique.name, phone_number: Faker::PhoneNumber.unique.cell_phone, rating: Faker::Number.between(1, 100), review: Faker::Restaurant.review, img_url: "https://unsplash.com/photos/ddZYOtZUnBk", cuisine_id: Cuisine.find(Faker::Number.between(1, 15)).id, description: Faker::Restaurant.description)
# Restaurant.create(name: Faker::Restaurant.unique.name, phone_number: Faker::PhoneNumber.unique.cell_phone, rating: Faker::Number.between(1, 100), review: Faker::Restaurant.review, img_url: "https://unsplash.com/photos/LR559Dcst70", cuisine_id: Cuisine.find(Faker::Number.between(1, 15)).id, description: Faker::Restaurant.description)
# Restaurant.create(name: Faker::Restaurant.unique.name, phone_number: Faker::PhoneNumber.unique.cell_phone, rating: Faker::Number.between(1, 100), review: Faker::Restaurant.review, img_url: "https://unsplash.com/photos/IGfIGP5ONV0", cuisine_id: Cuisine.find(Faker::Number.between(1, 15)).id, description: Faker::Restaurant.description)
# Restaurant.create(name: Faker::Restaurant.unique.name, phone_number: Faker::PhoneNumber.unique.cell_phone, rating: Faker::Number.between(1, 100), review: Faker::Restaurant.review, img_url: "https://unsplash.com/photos/ddZYOtZUnBk", cuisine_id: Cuisine.find(Faker::Number.between(1, 15)).id, description: Faker::Restaurant.description)
# Restaurant.create(name: Faker::Restaurant.unique.name, phone_number: Faker::PhoneNumber.unique.cell_phone, rating: Faker::Number.between(1, 100), review: Faker::Restaurant.review, img_url: "https://unsplash.com/photos/1Shk_PkNkNw", cuisine_id: Cuisine.find(Faker::Number.between(1, 15)).id, description: Faker::Restaurant.description)
