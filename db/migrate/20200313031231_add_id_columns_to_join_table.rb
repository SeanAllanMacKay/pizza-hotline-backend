class AddIdColumnsToJoinTable < ActiveRecord::Migration[6.0]
  def change
    add_column :tags_toppings, :tag_id, :string
    add_column :tags_toppings, :topping_id, :string
  end
end
