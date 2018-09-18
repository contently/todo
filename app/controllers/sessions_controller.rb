class SessionsController < ApplicationController

  def create
    @current_user = User.find_by_credentials(
      params[:user][:name],
      params[:user][:password])
    if @current_user
      log_in!(@current_user)
      render tasks_path
    else
      render json: ['Invalid name/password combination'], status: 401
    end
  end

  def destroy
    log_out
    render json: {}
  end
  
end
