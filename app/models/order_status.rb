class OrderStatus < ApplicationRecord

  def to_s
    self.description
  end
end
