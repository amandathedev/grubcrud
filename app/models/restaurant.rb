class Restaurant < ApplicationRecord
  belongs_to :cuisine
  has_many :items

  def restaurant_cuisine
    self.cuisines.name
  end
  
end
