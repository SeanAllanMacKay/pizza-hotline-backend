class AddImageFieldToCrusts < ActiveRecord::Migration[6.0]
  def change
    add_column :crusts, :imageUrl, :string
  end
end
