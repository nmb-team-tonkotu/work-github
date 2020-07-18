class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :customer_id
      t.string :customer_name
      t.string :postal_code
      t.string :address
      t.integer :postage
      t.integer :payment_method
      t.integer :billing_amount
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
