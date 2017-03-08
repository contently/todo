class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # HW5: lock down all controllers by default
  before_filter :require_login

  private

  def require_login
    @current_user = User.find_by_id(session[:current_user_id])
    unless @current_user
      redirect_to users_path
    end
  end

end
