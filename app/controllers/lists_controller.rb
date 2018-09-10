class ListsController < ApplicationController
    before_action :set_list, only: [:show, :edit, :update, :destroy]

    def show
        @task = Task.new
    end

    def new
        @user = User.find(params[:user_id])
    end

    def index
        @user = User.find(params[:user_id])
        redirect_to root_path unless @user == current_user
    end

    def create
        @user = User.find(params[:user_id])
        @list = @user.lists.new(params[:list].permit(:title))
        if @list.save
            redirect_to user_list_path(@user, @list)
        else
            @errors = @list.errors.full_messages
            render 'new'
        end
    end

    def destroy
        @list.destroy
        redirect_to user_lists_path(@user)
    end

    private
    def set_list
        @user = User.find(params[:user_id])
        redirect_to root_path unless @user == current_user
        @list = List.find_by(id: params[:id], user_id: @user.id)
    end

end
