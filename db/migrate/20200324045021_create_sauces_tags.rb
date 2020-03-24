class CreateSaucesTags < ActiveRecord::Migration[6.0]
  def change
    create_table :sauces_tags do |t|
      t.string :tag_id
      t.string :sauce_id

      t.timestamps
    end
  end
end
