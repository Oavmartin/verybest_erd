class CreateCuisineCategories < ActiveRecord::Migration
  def change
    create_table :cuisine_categories do |t|
      t.string :cuisine

      t.timestamps

    end
  end
end
