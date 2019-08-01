class ItemsController < ApplicationController
   
    def index
        restaurant = Restaurant.find_by(id: params[:id])
        @items = Item.where(restaurant_id: restaurant)
    end

end
