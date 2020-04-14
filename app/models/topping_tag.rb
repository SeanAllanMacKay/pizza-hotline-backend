class ToppingTag < ApplicationRecord
    validates :name, presence: true

    has_many :toppings_topping_tags

    has_many :toppings, through: :toppings_topping_tags
end
