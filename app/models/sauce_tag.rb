class SauceTag < ApplicationRecord
    validates :name, presence: true

    has_many :sauces_sauce_tags

    has_many :sauces, through: :sauces_sauce_tags
end
