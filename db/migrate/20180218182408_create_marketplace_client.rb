class CreateMarketplaceClient < ActiveRecord::Migration[5.0]
  def change
    create_table :marketplace_clients do |t|
    	t.float :revenue, null: false, default: 0.0
    end
  end
end
