# app/models/user.rb
class User < ApplicationRecord
  has_many :orders

  # Include default devise modules.
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Validations
  validates :email, presence: true
  validates :name, presence: true
  validates :address, presence: true
  validates :province, presence: true  # Assuming you want to validate presence of province too

  # Ransackable Attributes
  def self.ransackable_attributes(auth_object = nil)
    ["address", "created_at", "email", "id", "name", "updated_at", "username", "province"]
  end

  # Ransackable Associations
  def self.ransackable_associations(auth_object = nil)
    []
  end

  # Method to retrieve tax rate based on province
  def tax_rate
    case province
    when 'Alberta'
      0.05 # 5% GST
    when 'British Columbia'
      0.07 # 7% PST
    when 'Manitoba'
      0.07 # 7% PST
    when 'New Brunswick'
      0.15 # 15% HST
    when 'Newfoundland and Labrador'
      0.15 # 15% HST
    when 'Northwest Territories'
      0.05 # 5% GST
    when 'Nova Scotia'
      0.15 # 15% HST
    when 'Nunavut'
      0.05 # 5% GST
    when 'Ontario'
      0.13 # 13% HST
    when 'Prince Edward Island'
      0.15 # 15% HST
    when 'Quebec'
      0.05 # 5% GST
    when 'Saskatchewan'
      0.06 # 6% PST
    when 'Yukon'
      0.05 # 5% GST
    else
      0.0 # No tax by default
    end
  end
end
