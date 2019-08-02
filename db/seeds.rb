require "faker"

Cuisine.create(name: 'Japanese')
Cuisine.create(name: 'Mexican')
Cuisine.create(name: 'American')
Cuisine.create(name: 'Chinese')
Cuisine.create(name: 'Moroccan')
Cuisine.create(name: 'French')
Cuisine.create(name: 'Thai')
Cuisine.create(name: 'Italian')
Cuisine.create(name: 'German')

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
      cuisine_id: Cuisine.find(Faker::Number.between(1, 9)).id,
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
    price: Faker::Commerce.price(range = 1..30.0, as_string = false),
    description: Faker::Food.description,
    img_url: @food_url,
    restaurant_id: Faker::Number.between(1, 200)
  )
end
