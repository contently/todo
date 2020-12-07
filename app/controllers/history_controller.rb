class HistoryController < ApplicationController
  def index
    # All completed task and associated actions
    @tasks = current_user.tasks.complete.includes(:audits)
  end
end
