class CreateGenres < ActiveRecord::Migration[5.2]
  def change
    create_table :genres do |t|
      t.string :sweet_genre
      t.boolean :status, default: true

      t.timestamps
    end
  end
end
