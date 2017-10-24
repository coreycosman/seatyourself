class User < ApplicationRecord
  has_many :reservations
  has_many :restaurants, through: :reservations

  has_secure_password



  ALLOWED_ROLES = ["owner"]

  def allowed?
    ALLOWED_ROLES.include?(self.role)
  end
end
