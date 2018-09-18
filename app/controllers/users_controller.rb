class UsersController < ApplicationController

  def show
    @current_user = User.find(params[:id])
    render json: tasks_path
  end

  def new
    @current_user = User.new
  end

  def create
    @current_user = User.new(user_params)

    respond_to do |format|
      if @current_user.save
        log_in!(@current_user)
        format.html { redirect_to tasks_path }
      else
        format.html { render :new }
        format.json { render json: "Invalid name/password combination" }
      end
    end
  end


  private

  def user_params
    params.require(:user).permit(:name, :password)
  end
end
