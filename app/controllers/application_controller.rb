class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [
      :encrypted_password, :nickname, :last_name_zenkaku, :first_name_zenkaku,
      :l_name_zenkaku_katakana, :f_name_zenkaku_katakana, :date_of_birth
      ])
  end
end
