class Transaction < ApplicationRecord
	belongs_to :poster, foreign_key: :poster_id, class_name: 'User'
	belongs_to :requester, foreign_key: :requester_id, class_name: 'User'
	belongs_to :coupon
end
