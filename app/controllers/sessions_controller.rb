class SessionsController < ApplicationController

  def new
  end

  def create
    @current_user = User.find_by_credentials(
      params[:user][:name],
      params[:user][:password])

    respond_to do |format|
      if @current_user
        format.html { redirect_to tasks_path }
        format.json { render tasks_path }
      else
        format.html { render :new }
        render json: ['Invalid name/password combination'], status: 401
      end
    end
  end

  def delete
  end 

  def destroy
    log_out
    render json: {}
  end

end
