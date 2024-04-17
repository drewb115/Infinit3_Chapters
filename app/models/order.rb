# app/models/order.rb
class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items

  # Define ransackable associations to whitelist searchable associations
  def self.ransackable_associations(auth_object = nil)
    ['user', 'order_items'] # Update associations to include order_items
  end

  # Define ransackable attributes to whitelist searchable attributes
  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "id", "id_value", "status", "total_price", "updated_at", "user_id"]
  end
end