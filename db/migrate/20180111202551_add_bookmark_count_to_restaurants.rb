class AddBookmarkCountToRestaurants < ActiveRecord::Migration[5.0]
  def change
    add_column :restaurants, :bookmarks_count, :integer
  end
end
