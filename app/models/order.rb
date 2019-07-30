class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items
  has_many :items, through: :order_items


  def total_price
    price = 0
    self.items.each do |item|
      price += item.price
    end
    price
  end
end
