class Topping < ApplicationRecord
    validates :name, presence: true

    has_many :toppings_topping_tags

    has_many :topping_tags, through: :toppings_topping_tags
end
