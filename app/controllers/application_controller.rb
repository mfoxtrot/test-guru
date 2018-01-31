class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :set_locale

  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  def after_sign_in_path_for(user)
    if user.admin?
      admin_tests_path
    else
      super
    end
  end

  def default_url_options
    I18n.locale == I18n.default_locale ? {} : { lang: I18n.locale }
  end

  private

  def record_not_found
    render plain: '404 Not found', status: 404
  end

  private

  def set_locale
    I18n.locale = I18n.locale_available?(params[:lang]) ? params[:lang] : I18n.default_locale
  end

end
