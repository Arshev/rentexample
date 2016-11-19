class CarCondition < ApplicationRecord
  def to_s
    self.description
  end
end
