class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  add_flash_types :success, :warning, :danger, :info

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
    ## Permit first_name & last_name for user registration
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :create_customer])
    end
end
