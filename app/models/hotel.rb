class Hotel < ApplicationRecord
	# belongs_to :user, foreign_key: true
	has_many :bookings
	has_many :users, through: :bookings
	validates :title, :created_by, presence: true
end
