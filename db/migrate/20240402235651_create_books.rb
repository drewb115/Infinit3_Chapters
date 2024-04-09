class CreateBooks < ActiveRecord::Migration[7.1]
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.text :description
      t.decimal :price
      t.integer :stock_quantity
      t.string :genre
      t.string :image_url  # Add a new column for storing image URLs

      t.timestamps
    end
  end
end
