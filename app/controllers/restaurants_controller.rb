class RestaurantsController < ApplicationController   

  def index 
    @restaurants = Restaurant.all
  end

  def show 
    @restaurant = Restaurant.find(params[:id])
      if current_user
        @order_item = current_order.order_items.new
      end
  end 

end
