class SessionsController < ApplicationController
  include ApplicationHelper

  def new
    if logged_in?
      redirect_to @current_user
    end
  end

  def create
    session[:incorrect_count] ||= 0
    username = params[:username]
    password = params[:password]
    user = User.find_by(username: username)
      if user && user.authenticate(password)
        session[:user_id] = user.id
        redirect_to root_path
      else
    flash[:message] = "Incorrect username or password. Please try again."
    session[:incorrect_count] += 1
      if session[:incorrect_count] >= 100
        session[:lockout] = "You have exceeded your number of login attempts!"
      end
    redirect_to login_path
    end
  end

  def destroy
    session.delete(:user_id)
    session.delete(:order_id)
    redirect_to root_path
  end

  def absolve
    session[:lockout] = nil
    redirect_to login_path
  end
end