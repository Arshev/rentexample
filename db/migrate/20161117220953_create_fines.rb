class CreateFines < ActiveRecord::Migration[5.0]
  def change
    create_table :fines do |t|
      t.string :reason, null: false
      t.integer :cost, null: false

      t.belongs_to :order, class_name: 'Order'
    end
    add_foreign_key :fines, :orders, null: false
  end
end
