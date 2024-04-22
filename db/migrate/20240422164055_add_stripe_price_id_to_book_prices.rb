class AddStripePriceIdToBookPrices < ActiveRecord::Migration[7.1]
  def change
    add_column :book_prices, :stripe_price_id, :string
  end
end
