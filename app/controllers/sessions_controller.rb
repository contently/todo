class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by_credentials(params[:username], params[:password])
    if @user
      login(@user)
      redirect_to tasks_path
    else
      render :new
    end
  end

  def destroy
    @user = current_user
    if @user
      logout
      render :new
    end
  end

end