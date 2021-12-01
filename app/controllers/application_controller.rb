class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  # Code to handle invalid id passed to controllers
  rescue_from ActiveRecord::RecordNotFound, with: :redirect_to_root

  protected

    def after_sign_in_path_for(resource)
      if current_user.sign_in_count <= 3 && (Survey.first.present? && current_user.responses.first.blank?)
        show_survey_fill_path
      else
        root_path
      end
    end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit :sign_up, keys: [:user_name]
    devise_parameter_sanitizer.permit :account_update, keys: [:user_name]
  end

  private

  def redirect_to_root
    redirect_to root_path, notice: "The Record does not exists"
  end
end
