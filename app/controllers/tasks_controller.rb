class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  # Login first!
  before_action :authenticate_user!
  # Are you the right user to use these methods on specific task?
  before_action :access, only: [:show, :edit, :update, :destroy]

  def access
    # Check if the user_id matches the current_user! If not, go away!
    unless current_user.id == @task.user_id
      flash[:notice] = "That was not your task!"
      redirect_to :tasks
    end
  end

  # GET /tasks
  # GET /tasks.json
  def index
    # Grab all tasks by the current user where completed is false
    @user = current_user
    @tasks = @user.tasks.where(completed: false)
  end

  def completed
    # Grab all tasks by the current user where completed is true and render index
    @user = current_user
    @tasks = @user.tasks.where(completed: true)
    render :index
  end

  def all
    # Grab all tasks by the current user and render index
    @user = current_user
    @tasks = @user.tasks
    render :index
  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show
  end

  # GET /tasks/new
  def new
    @task = Task.new
  end

  # GET /tasks/1/edit
  def edit
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @task = Task.new(task_params)
    # Set user_id for relationship since it is not included in params
    @task.user_id = current_user.id if current_user

    respond_to do |format|
      if @task.save
        format.html { redirect_to tasks_path, notice: 'Task was successfully created.' }
        format.json { render :show, status: :created, location: @task }
      else
        format.html { render :new }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tasks/1
  # PATCH/PUT /tasks/1.json
  def update
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to tasks_path, notice: 'Task was successfully updated.' }
        format.json { render :show, status: :ok, location: @task }
      else
        format.html { render :edit }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @task.destroy
    respond_to do |format|
      format.html { redirect_to tasks_url, notice: 'Task was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_params
      params.require(:task).permit(:name, :completed)
    end
end
