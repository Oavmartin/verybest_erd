class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :restaurant_name
      t.string :address
      t.integer :neighborhood_id

      t.timestamps

    end
  end
end
