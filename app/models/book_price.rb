class BookPrice < ApplicationRecord
  belongs_to :book


  # Define ransackable attributes to whitelist searchable attributes
  def self.ransackable_attributes(auth_object = nil)
    ['price', 'start_date', 'end_date'] # or any other attributes you wish to whitelist
  end

  # Define ransackable associations to whitelist searchable associations
  def self.ransackable_associations(auth_object = nil)
    ['book']
  end
end
