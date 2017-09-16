class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

# ユーザー登録時にパラメーターのname属性の受け取りを許可
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

end
