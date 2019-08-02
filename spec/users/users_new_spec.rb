require 'spec_helper'

describe "Sign up page" do
  it "has a 'Full name' labeled field" do
    visit '/users/new'
    expect(page.body).to include("Full name:")
  end

  it "has a name field" do
    visit '/users/new'
    expect(page).to have_field("user[name]")
  end

  it "has a 'Create a username' labeled field" do
    visit '/users/new'
    expect(page.body).to include("Create a username:")
  end

  it "has a username field" do
    visit '/users/new'
    expect(page).to have_field("user[username]")
  end

  it "has a 'Create a password' labeled field" do
    visit '/users/new'
    expect(page.body).to include("Create a password:")
  end
  
  it "has a password field" do
    visit '/users/new'
    expect(page).to have_field("user[password]")
  end

  it "has a password field input of 'password' type" do
    visit '/users/new'
    page.should have_css('input[type="password"]')
  end
  
  it "has a 'Confirm password' labeled field" do
    visit '/users/new'
    expect(page.body).to include("Confirm password:")
  end
  
  it "has a password confirmation field" do
    visit '/users/new'
    expect(page).to have_field("user[password_confirmation]")
  end

  it "has an 'Enter your delivery address' labeled field" do
    visit '/users/new'
    expect(page.body).to include("Enter your delivery address:")
  end

  it "has an address field" do
    visit '/users/new'
    expect(page).to have_field("user[address]")
  end

  it "has an 'Email address' labeled field" do
    visit '/users/new'
    expect(page.body).to include("Email address:")
  end

  it "has an email field" do
    visit '/users/new'
    expect(page).to have_field("user[email]")
  end

  it "has a 'Phone number' labeled field" do
    visit '/users/new'
    expect(page.body).to include("Phone number:")
  end

  it "has a phone_number field" do
    visit '/users/new'
    expect(page).to have_field("user[phone_number]")
  end
  
  it "has a 'Create Account' button" do
    visit '/users/new'
    expect(page).to have_button("Create Account")
  end


  
end