class Booking < ApplicationRecord
  belongs_to :hotel
  validates :booking_reference, presence: true
  validates :booking_reference, uniqueness: true
end
