class CreateCars < ActiveRecord::Migration[5.0]
  def change
    create_table :cars do |t|
      t.string :brand, null: false
      t.integer :price, null: false
      t.belongs_to :status, :class_name => 'CarStatus', null: false
      t.belongs_to :condition, :class_name => 'CarCondition', null: false
    end
    add_foreign_key :cars, :car_statuses, column: 'status_id'
    add_foreign_key :cars, :car_conditions, column: 'condition_id'
  end
end
