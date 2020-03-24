class Tag < ApplicationRecord
    has_and_belongs_to_many :toppings
    has_and_belongs_to_many :crusts
    has_and_belongs_to_many :sauces
    has_and_belongs_to_many :specialty_pizzas
end
