# frozen_string_literal: true

class TasksController < ApplicationController
  before_action :set_task, only: %i[show edit update destroy]

  before_action :require_signed_in!
  before_action :check_list_owner

  # GET /tasks
  # GET /tasks.json
  def index
    @list = List.find(params[:list_id])
    @tasks = Task.where(list_id: params[:list_id])
  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show
    @list = List.find(params[:list_id])
    @tasks = Task.where(list_id: params[:list_id])
  end

  # GET /tasks/new
  def new
    @list = List.find(params[:list_id])
    @task = Task.new
  end

  # GET /tasks/1/edit
  def edit
    @list = List.find(params[:list_id])
    @tasks = Task.where(list_id: params[:list_id])
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @task = Task.new(task_params)
    @task.list_id = params[:list_id]
    respond_to do |format|
      if @task.save
        format.html { redirect_to list_tasks_path, notice: 'Task was successfully created.' }
        format.json { render :show, status: :created, location: @task }

      else
        format.html { render :new }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tasks/1
  # PATCH/PUT /tasks/1.json
  def update
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to list_tasks_path, notice: 'Task was successfully updated.' }
        format.json { render :show, status: :ok, location: @task }
      else
        format.html { render :edit }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @task.destroy
    respond_to do |format|
      format.html { redirect_to list_tasks_url, notice: 'Task was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_task
    @task = Task.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def task_params
    params.require(:task).permit(:name, :completed)
  end

  def check_list_owner
    @list = List.find(params[:list_id])
    redirect_to root_path unless check_owner(@list)
  end
end
