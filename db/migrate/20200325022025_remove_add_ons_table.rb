class RemoveAddOnsTable < ActiveRecord::Migration[6.0]
  def change
    drop_table :add_ons
  end
end
