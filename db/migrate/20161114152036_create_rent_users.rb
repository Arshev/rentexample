class CreateRentUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :rent_users do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.string :password, null: false
      t.belongs_to :role, :class_name => 'Role'
    end
    add_foreign_key :rent_users, :roles, null: false
  end
end
