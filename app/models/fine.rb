class Fine < ApplicationRecord
  belongs_to :order, class_name: 'Order'

  def to_s
    "#{self.order}: #{self.reason} - #{self.cost}"
  end
end
