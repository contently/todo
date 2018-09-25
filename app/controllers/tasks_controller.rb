class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  # GET /tasks
  # GET /tasks.json
  def index
    @list = List.find(params[:list_id])
    @tasks = @list.tasks.new
  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show
    @list = List.find(params[:list_id])
    @tasks = @list.tasks.all
  end

  # GET /tasks/new
  def new
    @list = List.find(params[:list_id])
    @task = @list.tasks.new
  end

  # GET /tasks/1/edit
  def edit
    @list = List.find(params[:list_id])
    @task = @list.tasks.find(params[:task_id])
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @list = List.find(params[:list_id])
    @task = @list.tasks.new(task_params)

    respond_to do |format|
      if @task.save
        format.html { redirect_to list_path(@task.list), notice: 'Task was successfully created.' }
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
    @list = List.find(params[:list_id])
    @task = @list.tasks.find(params[:id])
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to list_path(@task.list), notice: 'Task was successfully updated.' }
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
    @list = List.find(params[:list_id])
    @task = @list.tasks.find(params[:id])
    @task.destroy
    redirect_to list_path(@task.list)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      # @list = List.find(params[:list_id])
      @task = Task.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_params
      params.require(:task).permit(:name, :completed)
    end
end
