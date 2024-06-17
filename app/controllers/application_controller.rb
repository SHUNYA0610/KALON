class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!, except: [:top, :about], unless: :admin_url_check
  
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_in, keys: [:email]) # emailパラメーターを許可
  end
  
  def admin_url_check
    request.fullpath.include?("/admin")
  end
end  