class CreateOrderSweets < ActiveRecord::Migration[5.2]
  def change
    create_table :order_sweets do |t|
      t.integer :sweet_id
      t.integer :order_id
      t.integer :count
      t.integer :create_status, default: 0
      t.integer :price

      t.references :sweet, foreign_key: true
      t.references :order, foreign_key: true

      t.timestamps
    end
  end
end
