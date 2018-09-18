class VersionsController < ApplicationController

  def new
    @version = Version.new(version_params)
  end

  def create
    @version = Version.new(version_params)
    @version = @task.versions.new(version_params)

    if @version.save
      render json: @version
    else
      render json: @version.errors.full_messages, status: 422
    end
  end


  private

  def version_params
    params.require(:version).permit(:description, :task_id, :updated_at)
  end
end
