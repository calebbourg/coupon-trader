
class MarketplaceClient < ApplicationRecord
   # This class is used to mock the idea of a third party
   # account. In the real world that is probably what would 
   # be used to handle transactions and money stuff

   	def update_revenue(change)
	  new_revenue = revenue + change.to_f
	  if revenue >= 0
        update(revenue: new_revenue)
      else
      	self.errors.add(:revenue, "Cannot be negative")
      end
	end
end