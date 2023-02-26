class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?
    before_action :authenticate_shop!, except: [:top, :about]
    
  def after_sign_in_path_for(resource)
    menu_path
  end

  protected
# 新規登録・会員情報編集で名前を変更できるようにする
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end
end
