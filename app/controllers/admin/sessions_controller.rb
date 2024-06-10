# frozen_string_literal: true
class Admin::SessionsController < Devise::SessionsController
  #before_action :configure_sign_in_params, only: [:create]

  def after_sign_in_path_for(resource) #管理者のログイン後の遷移先
    admin_root_path
  end
  
  def after_sign_out_path_for(resource) #管理者のログアウト後の遷移先
    new_admin_session_path
  end
  
  def configure_sign_in_params
    devise_parameter_sanitizer.permit(:sign_in, keys: [:email]) # emailパラメーターを許可
  end
end