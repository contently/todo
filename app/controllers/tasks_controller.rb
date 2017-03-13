class TasksController < ApplicationController
  before_action :set_task
  before_action :set_list
  before_action :check_user

  # GET /lists/1/tasks
  # GET /lists/1/tasks.json
  def index
    @filter = params[:filter] || "All"
    @tasks = @list.tasks

    @filter, @tasks = Task.completed_filter(@filter, @tasks)
    respond_to do |format|
      format.html { redirect_to list_path(@list), notice: "" }
      format.json { render :index }
    end
  end

  # GET /lists/1/tasks/1.json
  def show
    respond_to do |format|
      format.html { redirect_to edit_list_task_path(@list, @task), notice: "" }
      format.json { render :show }
    end
  end

  # GET /lists/1/tasks/new
  def new
    @task = @list.tasks.build
  end

  # GET /lists/1/tasks/1/edit
  def edit
  end

  # POST /lists/1/tasks
  # POST /lists/1/tasks.json
  def create
    @task = @list.tasks.build(task_params)
    @task.update(completed: false)

    respond_to do |format|
      if @task.save
        format.html { redirect_to list_path(@list), notice: 'Task was successfully created.' }
        format.json { render :show, status: :created, location: @task }
      else
        format.html { render :new }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lists/1/tasks/1
  # PATCH/PUT /lists/1/tasks/1.json
  def update
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to list_path(@list), notice: 'Task was successfully updated.' }
        format.json { render :show, status: :ok, location: @task }
      else
        format.html { render :edit }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lists/1/tasks/1
  # DELETE /lists/1/tasks/1.json
  def destroy
    @task.destroy
    respond_to do |format|
      format.html { redirect_to list_url(@list), notice: 'Task was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id]) if params[:id]
    end

    def set_list
      @list = List.find(params[:list_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_params
      params.require(:task).permit(:name, :completed)
    end

    def check_user
     unless @list.user_id == current_user.id
      flash[:notice] = 'Access denied as you are not owner of this list'
      redirect_to lists_path
     end
    end
end
