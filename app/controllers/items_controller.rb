class ItemsController < ApplicationController
  def index
    @items = Item.all
    @order_item = current_order.order_items.new
  end
end
