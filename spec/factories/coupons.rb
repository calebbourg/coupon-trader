FactoryBot.define do
  factory :coupon do
  	value 5.00
  	association :user, factory: :user
    
  end
end
