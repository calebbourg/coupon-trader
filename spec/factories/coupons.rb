FactoryBot.define do
  factory :coupon do
  	name 'My Coupon'
  	value 5.00
  	brand 'my brand'
  	association :user, factory: :user
    
  end
end
