class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :authorize
  before_action :set_i18n_locale_from_params

  protected

  def authorize
    unless User.find_by(id: session[:user_id])
      redirect_to login_url, notice: "Пожалуйста, пройдите авторизацию"
    end
  end

  def set_i18n_locale_from_params
    @path = request.path_info
    if params[:set_locale]
      if I18n.available_locales.include?(params[:set_locale].to_sym)
        I18n.locale = params[:set_locale]
        redirect_to controller: params[:controller], action: params[:action]
      else
        locale_error = "#{params[:set_locale]} translation not available" # перевод недоступен
        flash.now[:notice] = locale_error
        logger.error locale_error
      end
    end
  end
end
