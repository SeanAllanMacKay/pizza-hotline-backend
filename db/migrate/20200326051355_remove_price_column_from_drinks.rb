class RemovePriceColumnFromDrinks < ActiveRecord::Migration[6.0]
  def change
    remove_column :drinks, :price, :string
  end
end
