class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  before_action :set_list
  before_action :authorize_check, except: [:index, :new, :create]

  # GET /lists/:list_id/tasks
  # GET /lists/:list_id/tasks.json
  def index
    current_user.owner?(@list)
    @tasks = @list.tasks.filter_on_completed(params[:filter]) # use query param 'filter' to decide whether to show incomplete or completed tasks
  end

  # GET /lists/:list_id/tasks/1
  # GET /lists/:list_id/tasks/1.json
  def show
  end

  # GET /lists/:list_id/tasks/new
  def new
    @task = Task.new
  end

  # GET /lists/:list_id/tasks/1/edit
  def edit
  end

  # POST /lists/:list_id/tasks
  # POST /lists/:list_id/tasks.json
  def create
    @task = Task.new(task_params)

    respond_to do |format|
      if @task.save
        format.html { redirect_to list_tasks_path(@list), notice: 'Task was successfully created.' }
        format.json { render :show, status: :created, location: @task }
      else
        format.html { render :new }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lists/:list_id/tasks/1
  # PATCH/PUT /lists/:list_id/tasks/1.json
  def update
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to list_tasks_path(@list), notice: 'Task was successfully updated.' }
        format.json { render :show, status: :ok, location: @task }
      else
        format.html { render :edit }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lists/:list_id/tasks/1
  # DELETE /lists/:list_id/tasks/1.json
  def destroy
    @task.destroy
    respond_to do |format|
      format.html { redirect_to list_tasks_url(@list), notice: 'Task was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    def set_list
      @list = List.find(params[:list_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_params
      params.require(:task).permit(:name, :completed).merge(list_id: @list.id)
    end

    # Check that the current user has access to this task
    def authorize_check
      current_user.owner?(@list)
    end
end
