class CreateCartItems < ActiveRecord::Migration[5.2]
  def change
    create_table :cart_items do |t|
      t.integer :customer_id
      t.integer :sweet_id
      t.integer :sweet_count

      t.timestamps
    end
  end
end
