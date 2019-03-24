class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception, if: :verify_api
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  def verify_api
    params[:controller].split('/')[0] != 'devise_token_auth'
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
  end
end
