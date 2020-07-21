class User < ApplicationRecord
	has_secure_password
  # Model associations
  # has_many :hotels, foreign_key: :created_by
  has_many :bookings
  has_many :hotels, through: :bookings

  # Validations
  validates_presence_of :name, :email, :password_digest

end
