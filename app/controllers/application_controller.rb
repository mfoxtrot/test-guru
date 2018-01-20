class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  helper_method :current_user,
                :logged_in?
  private

  def record_not_found
    render plain: '404 Not found', status: 404
  end

  def authenticate_user!
    unless current_user
      redirect_to login_path
    end

    cookies[:email] = current_user&.email
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def logged_in?
    current_user.present?
  end
end
