module Users
  class RegistrationsController < Devise::RegistrationsController
    before_action :configure_permitted_parameters

    protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.for(:account_update) << :username
      devise_parameter_sanitizer.for(:sign_up) << :username
    end
  end
end
