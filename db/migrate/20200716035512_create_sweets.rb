class CreateSweets < ActiveRecord::Migration[5.2]
  def change
    create_table :sweets do |t|
      t.string :name
      t.text :explanation
      t.integer :non_taxed_price
      t.text :image_id
      t.boolean :sell_status, default: true
      t.integer :genre_id

      t.timestamps
    end
  end
end
