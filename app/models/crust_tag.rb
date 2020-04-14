class CrustTag < ApplicationRecord
    validates :name, presence: true

    has_many :crusts_crust_tags

    has_many :crusts, through: :crusts_crust_tags
end
