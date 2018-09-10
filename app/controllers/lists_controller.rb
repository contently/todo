class ListsController < ApplicationController
  before_action :set_list, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
 
  
  # GET /lists
  # GET /lists.json

  def index
    @tasks = Task.all
    @lists = List.all
    redirect_to '/'
  end

  # GET /lists/1
  # GET /lists/1.json
  def show
    @tasks = Task.all
    @list = List.find(params[:id])
    @list_task = Task.where('list_id = ?', @list)
    @task = Task.new
  end

  # GET /lists/new
  def new
    @task = Task.new
    @list = List.new
  end

  # GET /lists/1/edit
  def edit
  end

  # POST /lists
  # POST /lists.json
  def create
    @list = List.new(list_params)
    @task = Task.new(task_params)

    respond_to do |format|
      if @list.save
        format.html { redirect_to list_path(@list.id), notice: 'List was successfully created.' }
        format.json { render :show, status: :created, location: @list }
      else
        format.html { render :new }
        format.json { render json: @lists.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lists/1
  # PATCH/PUT /lists/1.json
  def update
    respond_to do |format|
      if @list.update(list_params)
        format.html { redirect_to lists_path, notice: 'List was successfully updated.' }
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
      format.html { redirect_to lists_url, notice: 'List was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_list
      @list = List.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def list_params
      params.permit(:name, :user_id)
    end

    def task_params
      params.permit(:name, :completed, :list_id)
    end
end
