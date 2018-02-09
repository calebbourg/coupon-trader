FactoryBot.define do
  factory :brand do
  	name Faker::Name.name
    association :coupon, factory: :coupon
  end
end
