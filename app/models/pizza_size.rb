class PizzaSize < ApplicationRecord
    validates :name, presence: true
    validates :code, presence: true

    has_many :crusts_pizza_sizes

    has_many :crusts, through: :crusts_pizza_sizes
end
