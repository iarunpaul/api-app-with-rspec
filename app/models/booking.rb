class Booking < ApplicationRecord
  belongs_to :hotel
  validates :booking_reference, presence: true
end
