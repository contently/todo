class UsersController < ApplicationController
    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        respond_to do |format|
            if @user.save
                login(@user)
                format.html { redirect_to tasks_path }
            else
                format.html { render :new }
            end
        end
    end

    private

    def user_params
        params.require(:user).permit(:username, :password)
    end
end