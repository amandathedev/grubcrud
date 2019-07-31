class ItemsController < ApplicationController
    def index
        restaurant = Restaurant.find_by(id: params[:id])
        @items = Item.where(restaurant_id: restaurant)
        @order_item = current_order.order_items.new
    end



end
