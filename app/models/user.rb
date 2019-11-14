class User < ApplicationRecord
    has_many :food_control
    validates :password, confirmation: true
end
