class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?
  add_flash_types :error

  decent_configuration do
    strategy DecentExposure::StrongParametersStrategy
  end

  protect_from_forgery with: :exception

  protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:email, :firstname, 
        :lastname, :password, :password_confirmation) }
      devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:email, :firstname, 
        :lastname, :password, :password_confirmation, :current_password, :image_id) }
    end

    # def layout_by_resource
    #   if devise_controller? && action_name != 'edit'
    #     "devise"
    #   else
    #     "application"
    #   end
    # end
end
