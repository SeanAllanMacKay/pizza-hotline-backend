class FixBindingsRest < ActiveRecord::Migration[6.0]
  def change
    change_column :drinks_drink_sizes, :drink_id, 'integer USING CAST(drink_id AS integer)'
    change_column :drinks_drink_sizes, :drink_size_id, 'integer USING CAST(drink_size_id AS integer)'

    change_column :drinks_drink_tags, :drink_id, 'integer USING CAST(drink_id AS integer)'
    change_column :drinks_drink_tags, :drink_tag_id, 'integer USING CAST(drink_tag_id AS integer)'

    change_column :sauces_sauce_tags, :sauce_id, 'integer USING CAST(sauce_id AS integer)'
    change_column :sauces_sauce_tags, :sauce_tag_id, 'integer USING CAST(sauce_tag_id AS integer)'

    change_column :sides_side_sizes, :side_id, 'integer USING CAST(side_id AS integer)'
    change_column :sides_side_sizes, :side_size_id, 'integer USING CAST(side_size_id AS integer)'

    change_column :sides_side_tags, :side_id, 'integer USING CAST(side_id AS integer)'
    change_column :sides_side_tags, :side_tag_id, 'integer USING CAST(side_tag_id AS integer)'

    change_column :toppings_pizza_sizes, :topping_id, 'integer USING CAST(topping_id AS integer)'
    change_column :toppings_pizza_sizes, :pizza_size_id, 'integer USING CAST(pizza_size_id AS integer)'

    change_column :toppings_topping_tags, :topping_id, 'integer USING CAST(topping_id AS integer)'
    change_column :toppings_topping_tags, :topping_tag_id, 'integer USING CAST(topping_tag_id AS integer)'



  end
end
