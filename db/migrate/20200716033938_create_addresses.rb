class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string :postal_code
      t.string :address
      t.string :name
      t.integer :customer_id

      t.timestamps
    end
  end
end
