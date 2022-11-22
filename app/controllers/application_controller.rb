# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  layout 'application'

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[uin grade])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[uin grade])
  end
end
