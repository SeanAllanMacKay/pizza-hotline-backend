class CreateToppings < ActiveRecord::Migration[6.0]
  def change
    create_table :toppings do |t|
      t.string :name
      t.string :type
      t.string :description
      t.boolean :specialty
      t.boolean :vegetarian
      t.boolean :vegan
      t.boolean :gluten_free

      t.timestamps
    end
  end
end
