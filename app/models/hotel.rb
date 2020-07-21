class Hotel < ApplicationRecord
	has_many :users, through: :bookings
	validates :title, :created_by, presence: true
end
