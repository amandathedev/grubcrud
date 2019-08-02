class User < ApplicationRecord
    has_many :orders, dependent: :destroy
    validates_presence_of :username
    validates_presence_of :address
    validates_presence_of :email
    validates_presence_of :phone_number
    # validates_uniqueness_of :phone_number
    validates_uniqueness_of :username

    has_secure_password
end
