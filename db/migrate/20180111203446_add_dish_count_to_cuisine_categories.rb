class AddDishCountToCuisineCategories < ActiveRecord::Migration[5.0]
  def change
    add_column :cuisine_categories, :dishes_count, :integer
  end
end
