# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :configure_permitted_params, if: :devise_controller?
  before_action :set_current_user, if: :user_signed_in?

  protected

  def configure_permitted_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
    devise_parameter_sanitizer.permit(:account_updates, keys: [:username])
  end

  private

  def set_current_user
    Current.user = current_user
  end
end
