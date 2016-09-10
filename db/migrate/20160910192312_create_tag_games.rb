class CreateTagGames < ActiveRecord::Migration[5.0]
  def change
    create_table :tag_games do |t|
      t.references :game, foreign_key: true
      t.references :tag, foreign_key: true
      t.timestamps
    end
  end
end
