class UsersController < ApplicationController
    before_action :authorize, :except => [:index, :new, :create]

    def new
    end

    def index
        @users = List.first
    end

    def create
        # render text: params[:user].inspect
        @user = User.new(user_params)
        if @user.save
            redirect_to @user
        else
            @errors = @user.errors.full_messages
            render 'new'
        end
    end

    def show
        @user = User.find(params[:id])
        puts @user
        puts current_user
        redirect_to root_path unless @user == current_user
    end

    def user_params
        params.require(:user).permit(:name, :email, :password)
    end

end
