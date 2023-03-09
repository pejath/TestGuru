# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!

  protect_from_forgery with: :exception

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:username, :first_name, :last_name, :email, :password) }
  end

  def after_sign_in_path_for(user)
    flash[:notice] = "Hello, #{user.full_name}!"
    if user.admin?
      admin_tests_path
    else
      super
    end
  end
end
