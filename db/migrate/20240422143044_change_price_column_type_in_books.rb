class ChangePriceColumnTypeInBooks < ActiveRecord::Migration[7.1]
  def change
    change_column :books, :price, :integer
  end
end
