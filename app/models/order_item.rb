class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :item

  # validation

  def destroy
    @order_item = OrderItem.find(params[:id])
    @order_item.destroy
  end
end
