class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  def current_user?(user)
    current_user.id == user.id
  end
  helper_method :current_user?
# ApplicationController
  protected

#when user is not logged in
  def user_not_logged_in
    current_user.id == user.id
  end

  def configure_permitted_parameters
     devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:username, :email, :password, :password_confirmation, :remember_me) }
     devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:login, :username, :username, :email, :password, :remember_me) }
     devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:username, :email, :password, :password_confirmation, :remember_me) }
   end
end
