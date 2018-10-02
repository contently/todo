class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :logged_in?, :current_user


  private

  def login(user)
    @current_user = user
    session[:session_token] = user.reset_session_token!
  end

  def logout
    current_user.try(:reset_session_token!)
    session[:session_token] = nil
    @current_user = nil
  end

  def logged_in?
    !!current_user
  end

  def require_login
    redirect_to new_session_url unless logged_in?
  end

  def current_user
    return nil unless session[:session_token]
    @current_user ||= User.find_by(session_token: session[:session_token])
  end


end
