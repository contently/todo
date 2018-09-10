class SessionsController < ApplicationController

    def new
    end
  
    def create
      @user = User.find_by_email(params[:email])
      if @user && @user.authenticate(params[:password])
        session[:user_id] = @user.id
        redirect_to user_path(@user)
      else
        @error = "Invalid login, please try again."
        render 'new'
      end
    end
  
    def destroy
      session[:user_id] = nil
      redirect_to '/'
    end

end
