class AddGameToGames < ActiveRecord::Migration[5.0]
    def change
        add_column :games, :game, :string
    end
end
