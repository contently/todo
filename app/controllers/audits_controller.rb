# frozen_string_literal: true

class AuditsController < ApplicationController
  def index
    @audits = Audit.completed_tasks
  end
end
