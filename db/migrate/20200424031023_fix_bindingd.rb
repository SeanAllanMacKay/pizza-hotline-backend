class FixBindingd < ActiveRecord::Migration[6.0]
  def change
    change_column :crusts_crust_tags, :crust_id, :varchar
    change_column :crusts_crust_tags, :crust_tag_id, :varchar
  end
end
