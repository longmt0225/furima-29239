class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?
  # rescue_from Exception, with: :rescue_from_exception

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(
      :sign_up, keys: [:nickname, :family_name, :first_name, :family_name_kana, :first_name_kana, :birth_date]
    )
  end
end
