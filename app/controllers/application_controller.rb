class ApplicationController < ActionController::Base
  before_action :switch_locale
  before_action :configure_sign_up_params, only: [:create]

  def default_url_options
    I18n.locale == I18n.default_locale ? {} : { lang: I18n.locale }
  end

  def after_sign_in_path_for(current_user)
    if current_user.admin?
      admin_root_path
    else
      super
    end
  end
  
  private

  def switch_locale
    I18n.locale = I18n.locale_available?(params[:lang]) ? params[:lang] : I18n.default_locale
  end

  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])
  end
end
