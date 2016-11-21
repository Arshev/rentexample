class Order < ApplicationRecord
  belongs_to :car, class_name: 'Car'
  belongs_to :client, class_name: 'RentUser'
  belongs_to :admin, class_name: 'RentUser'
  belongs_to :status, class_name: 'OrderStatus'

  validates :car, :passport, :rent_time, :presence => true

  def to_s
    "#{self.client}: #{self.car}"
  end
end
