class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items
  has_many :items, through: :order_items

  before_save :update_total
  before_create :update_status

  def calculate_total
    self.order_items.collect { |i| i.item.price * i.quantity }.sum
  end

  private

  def update_status
    if self.status == nil?
      self.status = "In progress"
    end
  end

  def update_total
    self.total_price = calculate_total
  end


  # def total_price
  #   price = 0
  #   self.items.each do |item|
  #     price += item.price
  #   end
  #   price
  # end
end
