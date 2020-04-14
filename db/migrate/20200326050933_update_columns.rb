class UpdateColumns < ActiveRecord::Migration[6.0]
  def change
    add_column :sizes, :code, :string

    remove_column :drinks_sizes, :code, :string
    remove_column :drinks_sizes, :name, :string
    remove_column :drinks, :code, :string
  end
end
