require "faker"

Cuisine.create(name: 'Japanese', img_url: 'https://images.unsplash.com/photo-1553621042-f6e147245754?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80')
Cuisine.create(name: 'Mexican', img_url: 'https://images.unsplash.com/photo-1543352634-99a5d50ae78e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80')
Cuisine.create(name: 'American', img_url: 'https://images.unsplash.com/photo-1555196301-9acc011dfde4?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80')
Cuisine.create(name: 'Chinese', img_url: 'https://images.unsplash.com/photo-1525755662778-989d0524087e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80')
Cuisine.create(name: 'Moroccan', img_url: 'https://images.unsplash.com/photo-1517314626714-ac1b9a16515e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80')
Cuisine.create(name: 'French', img_url: 'https://images.unsplash.com/photo-1480951759438-f39a376462f2?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80')
Cuisine.create(name: 'Thai', img_url: 'https://images.unsplash.com/photo-1441850605338-1b0b5a22e7b9?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80')
Cuisine.create(name: 'Indian', img_url: 'https://images.unsplash.com/photo-1542367592-8849eb950fd8?ixlib=rb-1.2.1&auto=format&fit=crop&w=1500&q=80')
Cuisine.create(name: 'Italian', img_url: 'https://images.unsplash.com/photo-1498579150354-977475b7ea0b?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80')
Cuisine.create(name: 'German', img_url: 'https://images.unsplash.com/photo-1552913903-2cffa1962dc7?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80')

300.times do
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
      cuisine_id: Cuisine.find(Faker::Number.between(1, 10)).id,
      description: Faker::Restaurant.description
    )
end

5.times do
  User.create(
    name: Faker::Name.unique.name,
    username: Faker::Internet.unique.username,
    password: Faker::Internet.password,
    address: Faker::Address.full_address,
    email: Faker::Internet.unique.email,
    phone_number: Faker::PhoneNumber.unique.cell_phone
  )
end

2000.times do
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
    description: Faker::Food.description,
    img_url: @food_url,
    restaurant_id: Faker::Number.between(1, 200)
  )
end

# 5.times do
#   Order.create(
#     user_id: Faker::Number.between(1, 5),
#     status: Faker::Boolean.boolean,
#   )
# end