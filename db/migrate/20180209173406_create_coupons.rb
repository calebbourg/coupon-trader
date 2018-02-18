class CreateCoupons < ActiveRecord::Migration[5.0]
  def change
    create_table :coupons do |t|
      t.float :value, null: false, default: 0.0
      t.references :user
      t.string :brand, null: false

      t.timestamps
    end
  end
end
