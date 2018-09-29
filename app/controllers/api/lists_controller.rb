class Api::ListsController < ApplicationController
  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
    render "api/lists/show"
  end

  def create
    @list = List.new(list_params)
    @list.user_id = current_user.id

    if @list.save
      render "api/lists/show"
    else
      render json: @list.errors.full_messages, status: 422
    end
  end

  def update
    @list = List.find(params[:id])

    if @album.update(list_params)
      render "api/lists/show"
    else
      render json: @list.errors.full_messages, status: 422
    end
  end

  def destroy
    @list = List.find(params[:id])
    @list.destroy
    render 'api/lists/show'
  end

  private

  def list_params
    params.require(:list).permit(:name, :user_id)
  end
end
