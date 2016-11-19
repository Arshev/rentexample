class Car < ApplicationRecord
  belongs_to :status, class_name: 'CarStatus'
  belongs_to :condition, :class_name => 'CarCondition'

  def to_s
    self.brand
  end
end
