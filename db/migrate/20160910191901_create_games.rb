class CreateGames < ActiveRecord::Migration[5.0]
  def change
    create_table :games do |t|
      t.string :title
      t.references :user, foreign_key: true
      t.date :last_in_arcade
      t.integer :times_played
      t.string :status
      t.string :purchase_url
      t.text :game_description
      t.string :categories
      t.json :key_map
      t.string :image

      t.timestamps
    end
  end
end
