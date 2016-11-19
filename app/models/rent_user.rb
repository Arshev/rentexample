class RentUser < ApplicationRecord
  belongs_to :role, class_name: 'Role'

  def admin?
    self.role == Role.find(1)
  end

  def to_s
    self.email
  end
end
