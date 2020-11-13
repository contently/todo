class ListsController < ApplicationController
  before_action :authenticate_user!

  def index
    @lists = current_user.lists
  end

  def new
    @list = current_user.lists.new
  end

  def create
    @list = current_user.lists.build(list_params)

    respond_to do |format|
      if @list.save
        format.html { redirect_to root_path, notice: 'List was successfully created.'}
        format.json { }
      else
        format.html { render :new }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    @list = List.find params[:id]

    @show_completed = request.params.fetch(:showcompleted, false)
  end

  private

  def list_params
    params.require(:list).permit(:name)
  end
end
