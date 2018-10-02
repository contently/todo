class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by_credentials(
      params[:user][:username],
      params[:user][:password]
    )
    if @user
      debugger
      login(@user)
      format.html { redirect_to tasks_path }
      format.json { render :show, status: :created, location: @task }
    else
      flash.now[:errors] = ['Invalid username or password']
      render :new
    end
  end

  def destroy
    logout
    format.html { redirect_to new_session_path }
  end


end
