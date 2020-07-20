class Hotel < ApplicationRecord
	has_many :bookings, dependent: :destroy
	validates :title, :created_by, presence: true
end
