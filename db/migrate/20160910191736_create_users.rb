class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :company_name
      t.string :company_logo
      t.string :website
      t.string :twitter
      t.boolean :admin
      t.boolean :approved_user
      t.integer :number_of_employees
      t.string :email
      t.string :password_digest

      t.timestamps
    end
  end
end
