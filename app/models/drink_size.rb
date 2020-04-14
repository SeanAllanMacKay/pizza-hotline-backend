class DrinkSize < ApplicationRecord
    validates :name, presence: true
    validates :code, presence: true

    has_many :drinks_drink_sizes
    has_many :drinks, through: :drinks_drink_sizes
end
