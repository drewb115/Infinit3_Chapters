# app/models/page.rb
class Page < ApplicationRecord
  # Specify which attributes can be used for searching with Ransack
  def self.ransackable_attributes(auth_object = nil)
    %w[title page_type]
  end
end
