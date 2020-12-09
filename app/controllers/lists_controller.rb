class ListsController < ApplicationController

  before_action :authenticate_user!

  # GET /lists/new
  def new
    @list = current_user.lists.new
  end

  # POST /lists
  # POST /lists.json
  def create
    @list = current_user.lists.new(list_params)

    respond_to do |format|
      if @list.save
        format.html { redirect_to tasks_path, notice: 'List was successfully created.' }
        format.json { render :show, status: :created, location: @task }

      else
        format.html { render :new }
        format.json { render json: @list.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def list_params
    params.require(:list).permit(:name)
  end

end
