# frozen_string_literal: true

class ListsController < ApplicationController
  before_action :set_list, only: %i[show edit update destroy]

  # GET /lists
  # GET /lists.json
  def index
    @lists = current_user.lists
  end

  # GET /lists/1
  # GET /lists/1.json
  def show; end

  # GET /lists/new
  def new
    @list = current_user.lists.new
  end

  # GET /lists/1/edit
  def edit; end

  # POST /lists
  # POST /lists.json
  def create
    @list = current_user.lists.new(list_params)

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
      format.html { redirect_to lists_url, notice: 'List was successfully removed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_list
    @list = current_user.lists.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def list_params
    params.require(:list).permit(:name)
  end
end
