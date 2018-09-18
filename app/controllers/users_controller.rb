class UsersController < ApplicationController
  def show
    @current_user = User.find(params[:id])
  end

  def new
  end

  def create
    @current_user = User.new(user_params)

    respond_to do |format|
      if @current_user.save
        format.html { redirect_to tasks_path tasks_path}
      else
        format.html { render :new }
        format.json { render json: @current_user.errors, status: :unprocessable_entity }
      end
    end
  end


  private

  def user_params
    params.require(:user).permit(:name, :password)
  end
end
