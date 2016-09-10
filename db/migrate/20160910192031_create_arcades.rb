class CreateArcades < ActiveRecord::Migration[5.0]
  def change
    create_table :arcades do |t|
      t.string :title
      t.text :address
      t.float :latitude
      t.float :longitude
      t.integer :phone_number
      t.string :website
      t.string :status
      t.string :image

      t.timestamps
    end
  end
end
