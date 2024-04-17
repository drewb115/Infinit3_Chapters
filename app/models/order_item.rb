# app/models/order_item.rb
class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :book  # Update association to book

  # Define ransackable associations to whitelist searchable associations
  def self.ransackable_associations(auth_object = nil)
    ['order', 'book'] # List all associations you want to allow for searching
  end

  # Define ransackable attributes to whitelist searchable attributes
  def self.ransackable_attributes(auth_object = nil)
    ["book_id", "created_at", "id", "id_value", "order_id", "price", "quantity", "updated_at"]
  end
end