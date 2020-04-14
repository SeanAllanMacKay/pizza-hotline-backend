class Sauce < ApplicationRecord
    validates :name, presence: true

    has_many :sauces_sauce_tags

    has_many :sauce_tags, through: :sauces_sauce_tags
end
