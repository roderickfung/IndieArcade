class RemoveCategoriesColumnFromGames < ActiveRecord::Migration[5.0]
  def change
    remove_column :games, :categories
  end
end
