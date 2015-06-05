class ApplicationController < ActionController::Base

  add_flash_types :error

  decent_configuration do
    strategy DecentExposure::StrongParametersStrategy
  end

  protect_from_forgery with: :exception
end
