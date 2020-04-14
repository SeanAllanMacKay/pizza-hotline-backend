class CreateSidesTable < ActiveRecord::Migration[6.0]
  def change
    create_table :sides do |t|
      t.string :name
      t.string :description
      t.string :price
      t.string :code

      t.timestamps
    end
  end
end
