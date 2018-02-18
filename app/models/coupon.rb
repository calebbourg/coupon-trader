class Coupon < ApplicationRecord
	belongs_to :user

	validates_presence_of :value, :name, :brand
end
