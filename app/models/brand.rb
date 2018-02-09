class Brand < ApplicationRecord
	belongs_to :coupon

	validates_presence_of :name
end
