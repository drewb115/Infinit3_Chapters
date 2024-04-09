class CreateBookPrices < ActiveRecord::Migration[7.1]
  def change
    create_table :book_prices do |t|
      t.references :book, null: false, foreign_key: true
      t.decimal :price
      t.datetime :start_date
      t.datetime :end_date

      t.timestamps
    end
  end
end
