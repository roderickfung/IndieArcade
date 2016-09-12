class ChangeColumnGameToGameFileOnGames < ActiveRecord::Migration[5.0]
  def change
    rename_column :games, :game, :game_file
  end
end
