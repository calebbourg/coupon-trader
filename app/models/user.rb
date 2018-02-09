class User < ApplicationRecord
	has_secure_password

	validates_presence_of :email
	validates_presence_of :name
	validates_uniqueness_of :email


	def update_balance(new_balance)
      update(balance: (balance + new_balance.to_f))
	end
end
