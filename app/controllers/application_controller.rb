class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

    def after_sign_in_path_for(resource)
      if current_user.sign_in_count <= 3
        show_survey_fill_path
      end
    end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit :sign_up, keys: [:user_name]
    devise_parameter_sanitizer.permit :account_update, keys: [:user_name]
  end
end
