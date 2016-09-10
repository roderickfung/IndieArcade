class AddDefaultValueToUsers < ActiveRecord::Migration[5.0]
  def change
    change_column_default :users, :admin, false
    change_column_default :users, :approved_user, false
  end
end
