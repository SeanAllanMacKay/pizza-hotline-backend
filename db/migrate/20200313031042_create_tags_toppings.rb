class CreateTagsToppings < ActiveRecord::Migration[6.0]
  def change
    create_table :tags_toppings do |t|

      t.timestamps
    end
  end
end
