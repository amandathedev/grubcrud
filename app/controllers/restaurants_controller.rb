class RestaurantsController < ApplicationController   

  def index 
    @restaurants = Restaurant.all
  end

  def show 
    if session[:user_id]
      User.find(session[:user_id])
      @restaurant = Restaurant.find(params[:id])
      @order_item = current_order.order_items.new
    else
      flash[:message] = "Please login or sign up to place an order" 
      redirect_to login_path
    end
  end 

end
