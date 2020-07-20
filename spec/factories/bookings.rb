FactoryBot.define do
  factory :booking do
    booking_reference { Faker::Name.unique.name }
    payment_status { false }
    hotel_id { nil }
  end
end