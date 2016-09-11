class CreateArcadeGames < ActiveRecord::Migration[5.0]
  def change
    create_table :arcade_games do |t|
      t.references :game, foreign_key: true
      t.references :arcade, foreign_key: true
      
      t.timestamps
    end
  end
end
