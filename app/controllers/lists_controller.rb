class ListsController < ApplicationController
  before_action :require_logged_in

  def show
    @list = List.find(params[:id])
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)

    respond_to do |format|
      if @list.save
        format.html { redirect_to lists_path, notice: 'List was successfully created.' }
        format.json { render :show, status: :created, location: @list }
      else
        format.html { render :new }
        format.json { render json: @list.errors, status: :unprocessable_entity }
      end
    end
  end

  def index
    @lists = List.all
  end

  def destroy
    @list = List.find(params[:id])

    @list.destroy
    respond_to do |format|
      format.html { redirect_to tasks_url, notice: 'List was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  private

  def list_params
    params.require(:list).permit(:name)
  end
end
