class Item < ApplicationRecord
  belongs_to :restaurant
  has_many :order_items
end
