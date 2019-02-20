class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_locale
  include SessionsHelper

  private

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def default_url_options
    {locale: I18n.locale}
  end

  def logged_in_user
    return if logged_in?
    store_location
    flash[:danger] = t "please_login_account"
    redirect_to login_path
  end

  def admin_user
    return if current_user.isAdmin?
    flash[:danger] = t "not_you"
    redirect_to root_url
  end
end
