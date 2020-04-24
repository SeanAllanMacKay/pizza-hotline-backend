class FixBindings < ActiveRecord::Migration[6.0]

  def change
    change_column :crusts_crust_tags, :crust_id, 'integer USING CAST(crust_id AS integer)'
    change_column :crusts_crust_tags, :crust_tag_id, 'integer USING CAST(crust_tag_id AS integer)'

    change_column :crusts_pizza_sizes, :crust_id, 'integer USING CAST(crust_id AS integer)'
    change_column :crusts_pizza_sizes, :pizza_size_id, 'integer USING CAST(pizza_size_id AS integer)'
  end

end
