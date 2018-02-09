class User < ApplicationRecord
	has_secure_password

	has_many :coupons, dependent: :destroy
	has_many :poster_transactions, class_name: 'Transaction', foreign_key: 'poster_id'
	has_many :requester_transactions, class_name: 'Transaction', foreign_key: 'requester_id'

	validates_presence_of :email
	validates_presence_of :name
	validates_uniqueness_of :email
	validates_numericality_of :balance, greater_than_or_equal_to: 0.0


	def update_balance(change)
	  new_balance = balance + change.to_f
	  if new_balance >= 0
        update(balance: new_balance)
      else
      	self.errors.add(:balance, "Cannot be negative")
      end
	end
end
