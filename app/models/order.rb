class Order < ApplicationRecord
  belongs_to :user

  # Define ransackable associations to whitelist searchable associations
  def self.ransackable_associations(auth_object = nil)
    ['user'] # List all associations you want to allow for searching
  end

  # Define ransackable attributes to whitelist searchable attributes
  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "id", "id_value", "status", "total_price", "updated_at", "user_id"]
  end
end