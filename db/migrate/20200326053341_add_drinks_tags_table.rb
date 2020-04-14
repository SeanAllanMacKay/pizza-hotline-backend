class AddDrinksTagsTable < ActiveRecord::Migration[6.0]
  def change
    create_table :drinks_tags do |t|
      t.string :tag_id
      t.string :drink_id

      t.timestamps
    end
  end
end
