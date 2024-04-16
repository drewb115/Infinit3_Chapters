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
end
