class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    if params[:status] == 'incompleted' || params[:status] == nil
      @tasks = Task.incompleted_tasks
    elsif params[:status] == 'completed'
      @tasks = Task.completed_tasks
    elsif params[:status] == 'all'
      @tasks = Task.all
    end
  end

  def show
  end

  def new
    @task = Task.new
    @list = List.find(params[:list_id])
  end

  def edit
    @list = List.find(params[:list_id])
  end

  def create
    @task = Task.new(task_params)
    @list = List.find(params[:list_id])
    @task.list_id = @list.id

    respond_to do |format|
      if @task.save
        format.html { redirect_to list_tasks_path, notice: 'Task was successfully created.' }
        format.json { render :show, status: :created, location: @task }
      else
        format.html { render :new }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to list_tasks_path, notice: 'Task was successfully updated.' }
        format.json { render :show, status: :ok, location: @task }
      else
        format.html { render :edit }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @task.destroy
    respond_to do |format|
      format.html { redirect_to list_tasks_path, notice: 'Task was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:name, :completed)
  end
end
