class AddLiabilityColumnToGame < ActiveRecord::Migration[5.0]
  def change
    add_column :games, :liability, :boolean, default: :false
  end
end
