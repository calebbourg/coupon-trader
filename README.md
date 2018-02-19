

bundle install
bundle exec rake db:create && rake db:migrate
bundle exec rails s

API for coupon trading

JWT authorization

endpoints:

POST api/v1/users - create user [name, email, password]
POST api/v1/user_token - creates a JWT for the current_user which must be sent with each request headers as 
{ 'authorization': "bearer #{token}" }

GET api/v1/reports/full_report - get all information regarding user profiles and marketplace revenue

POST api/v1/users/update_balance { balance_change: <amount> } - add or subtract from your account balance

POST api/v1/coupons { coupon: { name: STRING, value: FLOAT, brand: STRING } } - create a new coupon

GET api/v1/coupons - receive list off all coupons
partitioned by ownership 
{ userOwnCoupons: [], requestableCoupons: [] }

POST api/v1/coupons/:coupon_id/transactions - will create a transaction transfering ownership of coupon with ID coupon_id to current_user. 5% of coupon value will be added to MarketplaceClient.revenue. The remaining balance is added to coupon poster's account from requesters account.
