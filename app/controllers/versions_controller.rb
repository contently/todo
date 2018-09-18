class VersionsController < ApplicationController
  before_action :require_logged_in
  def new
    @version = Version.new(version_params)
  end

  def create
    @version = Version.new(version_params)
  end


  private

  def version_params
    params.require(:version).permit(:description, :task_id, :updated_at)
  end
end
