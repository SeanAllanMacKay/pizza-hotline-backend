class CreateDrinksSizes < ActiveRecord::Migration[6.0]
  def change
    create_table :drinks_sizes do |t|
      t.string :size_id
      t.string :drink_id
      t.decimal :price
      t.string :code
      t.string :name

      t.timestamps
    end
  end
end
