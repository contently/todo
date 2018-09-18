class ListsController < ApplicationController
  # before_action :require_logged_in
  def show
  end

  def new
  end

  def create
  end

  def index
  end

  def destroy
  end 


  private

  def list_params
    params.require(:list).permit(:name)
  end
end
