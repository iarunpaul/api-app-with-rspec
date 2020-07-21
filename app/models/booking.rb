class Booking < ApplicationRecord
  belongs_to :hotel
  belongs_to :user
  validates :booking_reference, presence: true
  validates :booking_reference, uniqueness: true
end
