class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  helper_method :current_user,
                :logged_in?,
                :return_point
  private

  def record_not_found
    render plain: '404 Not found', status: 404
  end

  def authenticate_user!
    unless current_user
      set_return_point(request.url)
      redirect_to login_path
    end
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def logged_in?
    current_user.present?
  end

  def set_return_point(return_point)
    session[:return_point] = return_point
  end

  def return_point
    session[:return_point] || root_path
  end

end
