class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by_credentials(
      params[:user][:username],
      params[:user][:password]
    )
    if @user
      login(@user)
      redirect_to tasks_url
    else
      flash.now[:errors] = ['Invalid username or password']
      redirect_to new_session_url
    end
  end

  def destroy
    logout
    redirect_to new_session_url
  end


end
