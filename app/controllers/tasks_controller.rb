# frozen_string_literal: true

class TasksController < ApplicationController
  before_action :set_task, only: %i[show edit update destroy]
  before_action :authenticate_user!
  before_action :redirect_user_without_list

  def index
    @lists = current_user.lists.includes(:tasks)
  end

  def show; end

  def new
    @list = List.find params[:list_id]
    @task = @list.tasks.build
  end

  def create
    @list = List.find params[:list_id]
    @task = @list.tasks.build(task_params)

    respond_to do |format|
      if @task.save
        format.html { redirect_to list_path(@list.id), notice: 'Task was successfully created.' }
        format.json { render :show, status: :created, location: @task }

      else
        format.html { render :new }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  def update

    respond_to do |format|
      if @task.toggle(:completed).save
        # Ideally would capture the current query string and append it to the URL to maintain
        # the user's current frame of reference
        format.html { redirect_to list_path(@task.list_id), notice: update_notice(@task) }
        format.json { render :show, status: :ok, location: @task }
      else
        format.html { redirect_back(fallback_location: root) }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_task
    @task = Task.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def task_params
    params.require(:task).permit(:name)
  end

  def redirect_user_without_list
    redirect_to new_list_path if current_user.lists.blank?
  end

  def update_notice(task)
    task.completed ? 'Task was marked as complete.' : 'Task was marked as incomplete'
  end
  
end
