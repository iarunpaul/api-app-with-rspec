require 'rails_helper'

RSpec.describe Hotel, type: :model do
  it { should have_many(:bookings).dependent(:destroy) }
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:created_by) }

end
