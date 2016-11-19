class CreateCarStatuses < ActiveRecord::Migration[5.0]
  def change
    create_table :car_statuses do |t|
      t.string :description, null: false
    end
  end
end
