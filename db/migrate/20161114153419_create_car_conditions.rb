class CreateCarConditions < ActiveRecord::Migration[5.0]
  def change
    create_table :car_conditions do |t|
      t.string :description
    end
  end
end
