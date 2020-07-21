require 'rails_helper'

RSpec.describe Booking, type: :model do
  it { should belong_to(:hotel) }
  it { should validate_presence_of(:booking_reference) }
  it { should validate_uniqueness_of(:booking_reference) }
end
