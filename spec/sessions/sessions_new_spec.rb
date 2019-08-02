require 'spec_helper'

describe "Login page" do
  it "has a username field" do
    visit '/login'
    expect(page).to have_field("username")
  end
  
  it "has a password field" do
    visit '/login'
    expect(page).to have_field("password")
  end
  
  # it "has a 'Log In' button" do
  #   visit '/login'
  #   expect(page).to have_button("Login")
  # end

end