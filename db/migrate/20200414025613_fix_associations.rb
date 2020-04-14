class FixAssociations < ActiveRecord::Migration[6.0]
  def change
    drop_table :sizes
    drop_table :crusts_tags
    drop_table :drinks_sizes
    drop_table :drinks_tags
    drop_table :sauces_tags
    drop_table :sides_tags
    drop_table :tags
    drop_table :tags_toppings

    remove_column :sides, :price

    ############################################
    ## DRINKS
    ############################################

      create_table :drink_sizes do |t|
        t.string :name
        t.string :code
        t.integer :amount
        t.string :unit

        t.timestamps
      end

      create_table :drink_tags do |t|
        t.string :name
        t.string :description

        t.timestamps
      end

      create_table :drinks_drink_tags do |t|
        t.string :drink_id
        t.string :drink_tag_id

        t.timestamps
      end

      create_table :drinks_drink_sizes do |t|
        t.string :drink_id
        t.string :drink_size_id
        t.decimal :price

        t.timestamps
      end

    ############################################
    ## PIZZAS
    ############################################

      create_table :pizza_sizes do |t|
        t.string :name
        t.string :code
        t.integer :size

        t.timestamps
      end

      ############################################
      ## CRUSTS
      ############################################

        create_table :crust_tags do |t|
          t.string :name
          t.string :description

          t.timestamps
        end

        create_table :crusts_crust_tags do |t|
          t.string :crust_id
          t.string :crust_tag_id

          t.timestamps
        end

        create_table :crusts_pizza_sizes do |t|
          t.string :crust_id
          t.string :pizza_size_id
          t.decimal :first_price
          t.decimal :additional_price

          t.timestamps
        end

      ############################################
      ## TOPPINGS
      ############################################

        create_table :topping_tags do |t|
          t.string :name
          t.string :description

          t.timestamps
        end

        create_table :toppings_topping_tags do |t|
          t.string :topping_id
          t.string :topping_tag_id

          t.timestamps
        end

        create_table :toppings_pizza_sizes do |t|
          t.string :topping_id
          t.string :pizza_size_id
          t.decimal :price

          t.timestamps
        end

      ############################################
      ## SAUCES
      ############################################

        create_table :sauce_tags do |t|
          t.string :name
          t.string :description

          t.timestamps
        end

        create_table :sauces_sauce_tags do |t|
          t.string :sauce_id
          t.string :sauce_tag_id

          t.timestamps
        end

    ############################################
    ## SIDES
    ############################################

      create_table :side_sizes do |t|
        t.string :name
        t.integer :amount

        t.timestamps
      end

      create_table :side_tags do |t|
        t.string :name
        t.string :description

        t.timestamps
      end

      create_table :sides_side_tags do |t|
        t.string :side_id
        t.string :side_tag_id

        t.timestamps
      end

      create_table :sides_side_sizes do |t|
        t.string :side_id
        t.string :side_size_id
        t.decimal :price
        t.string :code

        t.timestamps
      end

  end
end
