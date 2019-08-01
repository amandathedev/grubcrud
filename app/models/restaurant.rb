class Restaurant < ApplicationRecord
  belongs_to :cuisine
  has_many :items

end
