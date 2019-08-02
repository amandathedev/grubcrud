  require 'spec_helper'

  describe "Index page" do
    it "has a 'Log In'  labeled link" do
      visit '/'
      expect(page.body).to include("Log In")
    end

    it "Log In links to the login page" do
      visit '/'
      expect(page).to have_link(nil, href: '/login')
    end

    it "has a 'Sign Up' labeled link" do
      visit '/'
      expect(page.body).to include("Sign Up")
    end

    it "Sign Up links to the sign up page page" do
      visit '/'
      expect(page).to have_link(nil, href: '/users/new')
    end

  end
