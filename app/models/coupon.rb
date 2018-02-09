class Coupon < ApplicationRecord
	belongs_to :user
	has_one :brand

	validates_presence_of :value
end
