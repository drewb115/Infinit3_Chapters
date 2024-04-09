class AdminUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable

  # Define ransackable attributes to whitelist searchable attributes
  def self.ransackable_attributes(auth_object = nil)
    # List of attributes you want to be searchable
    ['id', 'email', 'created_at', 'updated_at']
  end
end
