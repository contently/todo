class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy, :mark_complete]

  def index
    user = User.find(params[:user_id])
    @list = List.find_by(id: params[:list_id], user_id: user.id)
    if params[:show_all] && params[:show_all] == "true"
      @tasks = @list.tasks.all
      @subtitle = "All Tasks"
    elsif params[:show_complete] && params[:show_complete] == "true"
      @tasks = @list.completed_tasks
      @subtitle = "All Completed Tasks"
    else
      redirect_to user_list_path(user, @list)
    end
  end

  def create
    @user = User.find(params[:user_id])
    @list = List.find_by(id: params[:list_id], user_id: @user.id)
    @task = @list.tasks.new(task_params)

    @task.save
    redirect_to user_list_path(@user, @list)
  end


  def mark_complete
    @task.completed = true
    @task.save

    redirect_to user_list_path(@user, @list)
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @task.destroy
    respond_to do |format|
      format.html { redirect_to user_list_path(@user, @list) }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      # @task = Task.find(params[:id])
      @user = User.find(params[:user_id])
      redirect_to root_path unless @user == current_user
      @list = List.find_by(id: params[:list_id], user_id: @user.id)
      @task = Task.find_by(id: params[:id], list_id: @list.id)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_params
      params.require(:task).permit(:name)
    end
end
