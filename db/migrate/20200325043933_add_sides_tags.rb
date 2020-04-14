class AddSidesTags < ActiveRecord::Migration[6.0]
  def change
    create_table :sides_tags do |t|
      t.string :tag_id
      t.string :side_id

      t.timestamps
    end
  end
end
