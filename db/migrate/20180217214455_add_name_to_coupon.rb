class AddNameToCoupon < ActiveRecord::Migration[5.0]
  def change
  	add_column :coupons, :name, :string, null: false
  end
end
