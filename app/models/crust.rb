class Crust < ApplicationRecord
    validates :name, presence: true
    has_one_attached :image

    has_many :crusts_crust_tags
    has_many :crusts_pizza_sizes

    has_many :crust_tags, through: :crusts_crust_tags
    has_many :pizza_sizes, through: :crusts_pizza_sizes
end
