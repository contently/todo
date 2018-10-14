class ListsController < ApplicationController
  before_action :require_signed_in!

  def index
    @lists = List.all
  end

  def show
    @list = List.includes(:tasks).find(params[:id])
    @tasks = @list.tasks
    if !check_owner(@list)
      redirect_to root_path
    end
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    @list.user_id = current_user.id
    if @list.save
      redirect_to list_url(@list)
    else
      flash.now[:errors] = @list.errors.full_messages
      render :new
    end
  end

  def edit
    @list = current_user.lists.find(params[:id])
  end

  def update
    @list = current_user.lists.find(params[:id])
    if @list.update_attributes(list_params)
      redirect_to list_url(@list)
    else
      flash.now[:errors] = @list.errors.full_messages
      render :edit
    end
  end

  def destroy
    @list = List.find(params[:id])
    if @list.user_id == current_user.id
      @list.destroy
      redirects_to lists_url
    else
      flash[:errors] = ["you do not have permission to delete this post"]
      redirect_to list_url(@list)
    end
  end

  private

  def list_params
    params.require(:list).permit(:name, :description)
  end
end
