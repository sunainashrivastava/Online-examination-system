# frozen_string_literal: true

# Application conrtoller
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  rescue_from ActiveRecord::RecordNotFound, with: :render_404

  protected

  def configure_permitted_parameters
    added_attrs = [:username,
                   :firstname,
                   :lastname,
                   :email,
                   :password,
                   :password_confirmation,
                   :remember_me,
                   :avatar]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end
  rescue_from CanCan::AccessDenied do
    flash[:error] = 'Access denied.'
    redirect_to root_url
  end

  def render_404
    render template: 'take_tests/error404', status: 404
  end
end
