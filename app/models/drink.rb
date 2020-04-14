class Drink < ApplicationRecord
    validates :name, presence: true

    has_many :drinks_drink_sizes
    has_many :drinks_drink_tags

    has_many :drink_sizes, through: :drinks_drink_sizes
    has_many :drink_tags, through: :drinks_drink_tags
end
