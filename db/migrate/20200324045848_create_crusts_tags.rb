class CreateCrustsTags < ActiveRecord::Migration[6.0]
  def change
    create_table :crusts_tags do |t|
      t.string :tag_id
      t.string :crust_id

      t.timestamps
    end
  end
end
