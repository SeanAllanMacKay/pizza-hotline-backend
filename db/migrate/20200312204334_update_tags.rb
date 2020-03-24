class UpdateTags < ActiveRecord::Migration[6.0]
  def change
    remove_column :toppings, :topping_type, :string
    remove_column :toppings, :vegan, :boolean
    remove_column :toppings, :vegetarian, :boolean
    remove_column :toppings, :gluten_free, :boolean
    remove_column :toppings, :specialty, :boolean

    remove_column :sauces, :vegan, :boolean
    remove_column :sauces, :vegetarian, :boolean
    remove_column :sauces, :gluten_free, :boolean

    remove_column :crusts, :vegan, :boolean
    remove_column :crusts, :vegetarian, :boolean
    remove_column :crusts, :gluten_free, :boolean

    add_column :tags, :description, :string
  end
end
