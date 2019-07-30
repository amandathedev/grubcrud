class User < ApplicationRecord
    has_many :orders
    has_many :items, through: :orders
end
