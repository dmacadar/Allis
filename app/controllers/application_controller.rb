class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
   logger.info "<En este momento se esta ejecutando el sanitizer>"
       devise_parameter_sanitizer.for(:sign_up) {|u| u.permit(:email,:password, :password_confirmation)}
  end
end