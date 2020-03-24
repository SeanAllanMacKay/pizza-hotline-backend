class RenameToppingType < ActiveRecord::Migration[6.0]
  def change
    rename_column :toppings, :type, :topping_type
  end
end
