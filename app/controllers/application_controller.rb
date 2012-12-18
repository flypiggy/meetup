class ApplicationController < ActionController::Base
  protect_from_forgery

  def current_user
    User.find_by_token(session[:token]) if session[:token]
  end

  def logged?
    !!current_user
  end

  def require_logged_in
    redirect_to login_path, alert: "require login" unless logged?
  end

  helper_method :current_user, :logged?
end
