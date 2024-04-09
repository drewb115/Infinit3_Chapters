class PageContent < ApplicationRecord

  # Your existing code...

  def self.ransackable_attributes(auth_object = nil)
    ["content", "created_at", "id", "id_value", "title", "updated_at"]
    # Add any other attributes you want to be searchable
  end

  # Your existing code...

end
