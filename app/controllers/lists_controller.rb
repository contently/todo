class ListsController < ApplicationController
  before_action :set_list, only: [:show, :edit, :update, :destroy]
  before_action :check_user, only: [:show, :edit, :update, :destroy]

  # GET /lists
  # GET /lists.json
  def index
    @lists = List.order(created_at: :desc)
                 .where(user_id: current_user.id)
  end

  # GET /lists/audit_log
  # GET /lists/audit_log.json
  def audit_log
    @task_changes = current_user.task_changes.order(created_at: :desc)
  end

  # GET /lists/1
  # GET /lists/1.json
  def show
    @filter = params[:filter]
    @tasks = @list.tasks

    @filter, @tasks = Task.completed_filter(@filter, @tasks)
  end

  # GET /lists/new
  def new
    @list = List.new
  end

  # GET /lists/1/edit
  def edit
  end

  # POST /lists
  # POST /lists.json
  def create
    @list = List.new(list_params)
    @list.user_id = current_user.id

    respond_to do |format|
      if @list.save
        format.html { redirect_to list_path(@list), notice: 'list was successfully created.' }
        format.json { render :show, status: :created, location: @list }
      else
        format.html { render :new }
        format.json { render json: @list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lists/1
  # PATCH/PUT /lists/1.json
  def update
    respond_to do |format|
      if @list.update(list_params)
        format.html { redirect_to list_path, notice: 'list was successfully updated.' }
        format.json { render :show, status: :ok, location: @list }
      else
        format.html { render :edit }
        format.json { render json: @list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lists/1
  # DELETE /lists/1.json
  def destroy
    @list.destroy
    respond_to do |format|
      format.html { redirect_to lists_path, notice: 'list was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_list
      begin
        @list = List.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        flash[:notice] = 'Access denied as this list does not exist'
        redirect_to lists_path
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def list_params
      params.require(:list).permit(:name)
    end

    def check_user
     unless @list.user_id == current_user.id
      flash[:notice] = 'Access denied as you are not owner of this list'
      redirect_to lists_path
     end
    end
end
