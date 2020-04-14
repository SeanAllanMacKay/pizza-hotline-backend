class FixToppingPriceToPizzaSize < ActiveRecord::Migration[6.0]
  def change
    remove_column :pizza_sizes, :topping_price, :decimal
    add_column :pizza_sizes, :topping_price, :decimal, :default => 0.00
  end
end
