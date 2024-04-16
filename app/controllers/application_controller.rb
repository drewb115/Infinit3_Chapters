class ApplicationController < ActionController::Base
  include Devise::Controllers::Helpers # Add this line to include Devise helper methods

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    # Permit the new user attributes in the sign up form
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :address, :city, :province])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :address, :city, :province])
  end
end
