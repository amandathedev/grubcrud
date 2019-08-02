class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_order

  def current_order
    if session[:order_id]
      Order.find(session[:order_id])
    else
      order = Order.create(user_id: session[:user_id], status: false)
      session[:order_id] = order.id
      order
    end
  end

  def current_user
    if session[:user_id]
      User.find(session[:user_id])
    else
      flash[:message] = "Please login or sign up to place an order" 
      redirect_to login_path
    end
  end

end