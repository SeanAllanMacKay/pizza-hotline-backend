class CreateCrusts < ActiveRecord::Migration[6.0]
  def change
    create_table :crusts do |t|
      t.string :name
      t.string :description
      t.boolean :vegan
      t.boolean :gluten_free
      t.boolean :vegetarian

      t.timestamps
    end
  end
end
