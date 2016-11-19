class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.integer :rent_time, null: false
      t.string :passport, null: false
      t.string :comment
      t.belongs_to :car, class_name: 'Car', null: false
      t.belongs_to :client, class_name: 'RentUser', null: false
      t.belongs_to :admin, class_name: 'RentUser', null: false
      t.belongs_to :status, class_name: 'OrderStatus', null: false
    end
    add_foreign_key :orders, :rent_users, column: 'client_id'
    add_foreign_key :orders, :rent_users, column: 'admin_id'
    add_foreign_key :orders, :order_statuses, column: 'status_id'
    add_foreign_key :orders, :cars
  end
end
