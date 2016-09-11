class AddDefaultValueToUsers < ActiveRecord::Migration[5.0]
    def change
        change_column_default :users, :admin, false # default false
        change_column_default :users, :approved_user, false # default false
    end
end
