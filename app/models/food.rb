class Food < ApplicationRecord
    has_many :food_control
    belongs_to :category
end
