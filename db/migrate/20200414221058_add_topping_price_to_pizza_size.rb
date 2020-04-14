class AddToppingPriceToPizzaSize < ActiveRecord::Migration[6.0]
  def change
    add_column :pizza_sizes, :topping_price, :decimal
  end
end
