FactoryBot.define do
	factory :user do
		name { Faker::Name.name }
		email { 'test@email.com' }
		password { 'password' }

	end
end