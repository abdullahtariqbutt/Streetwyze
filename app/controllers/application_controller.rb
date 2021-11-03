class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  # Redirect to a specific page on successful sign in and out
  def after_sign_in_path_for(resource)
    assets_path
  end
  
  def after_sign_out_path_for(resource)
    assets_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit :sign_up, keys: [:user_name]
    devise_parameter_sanitizer.permit :account_update, keys: [:user_name]
  end
end
