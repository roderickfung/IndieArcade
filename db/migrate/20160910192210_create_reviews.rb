class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.references :game, foreign_key: true
      t.integer :fun
      t.integer :playability
      t.integer :difficulty

      t.timestamps
    end
  end
end
